# frozen_string_literal: true

class Spree::Admin::PurchasePolicyTypesController < Spree::Admin::ResourceController
  helper Spree::BaseHelper

  def index
    @purchase_policy_types = collection
  end

  def new
    @purchase_policy_type = Spree::PurchasePolicyType.new
    authorize! :create, @purchase_policy_type
  end

  def edit
    @purchase_policy_type = Spree::PurchasePolicyType.find(params[:id])
    if @purchase_policy_type.user.nil?
      flash[:error] = I18n.t('spree.error_no_user')
      redirect_to admin_purchase_policy_types_path
    end
  end

  def create
    @purchase_policy_type = Spree::PurchasePolicyType.new(purchase_policy_type_params)
    @purchase_policy_type.user = spree_current_user
    authorize! :create, @purchase_policy_type
    if @purchase_policy_type.save
      flash[:notice] = I18n.t('spree.purchase_policy_type_successfully_submitted')
      redirect_to admin_purchase_policy_types_path
    end
  end

  def update
    @purchase_policy_type = Spree::PurchasePolicyType.find(params[:id])

    authorize! :update, @purchase_policy_type
    if @purchase_policy_type.update(purchase_policy_type_params)
      flash[:notice] = I18n.t('spree.purchase_policy_type_successfully_submitted')
      redirect_to admin_purchase_policy_types_path
    else
      render :edit
    end
  end

  private

  def collection
    params[:q] ||= {}
    @search = Spree::PurchasePolicyType.ransack(params[:q])
    @collection = @search.result.includes([:user, :purchase_policies]).page(params[:page]).per(params[:per_page])
  end

  def permitted_purchase_policy_type_attributes
    [:name]
  end

  def purchase_policy_type_params
    params.require(:purchase_policy_type).permit(permitted_purchase_policy_type_attributes)
  end
end
