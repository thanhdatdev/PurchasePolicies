# frozen_string_literal: true

class Spree::PurchasePoliciesController < Spree::StoreController
  before_action :load_purchase_policy_type

  def index
    @purchase_policies = Spree::PurchasePolicy.all
  end

  def show
    @purchase_policy = Spree::PurchasePolicy.find_by(id: params[:id])
  end

  private

  def load_purchase_policy_type
    @purchase_policy_types = Spree::PurchasePolicyType.all
  end
end
