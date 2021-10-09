# frozen_string_literal: true

class Spree::PurchasePolicyTypesController < Spree::StoreController
  before_action :load_purchase_policy

  def index
    @purchase_policy_types = Spree::PurchasePolicyType.all
  end

  def show
    @purchase_policy_type = Spree::PurchasePolicyType.find(params[:id])
  end

  protected

  def load_purchase_policy_types
    @purchase_policy ||= Spree::PurchasePolicy.find_by!(id: params[:purchase_policy_id])
  end
end
