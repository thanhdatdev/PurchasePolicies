# frozen_string_literal: true

class Spree::PurchasePolicyTypesController < Spree::StoreController
  before_action :load_purchase_policy

  def create
    if @purchase_policy.present?
      @purchase_policy_type = @purchase_policy.purchase_policy_type.new(purchase_policy_type_params)
      @purchase_policy_type.user = spree_current_user
      authorize! :create, @purchase_policy_type
      @purchase_policy_type.save
    end

    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js { render action: :create }
    end
  end

  def edit; end

  protected

  def load_purchase_policy_types
    @purchase_policy ||= Spree::PurchasePolicy.find_by!(id: params[:purchase_policy_id])
  end

  def permitted_purchase_policy_type_attributes
    [:name, :position]
  end

  def purchase_policy_type_params
    params.require(:purchase_policy_type).permit(permitted_purchase_policy_type_attributes)
  end
end
