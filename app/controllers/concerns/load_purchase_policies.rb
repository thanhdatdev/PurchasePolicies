# frozen_string_literal: true

module LoadPurchasePolicies
  extend ActiveSupport::Concern

  included do
    before_action :load_purchase_policies
    before_action :load_purchase_policy_types
  end

  private

  def load_purchase_policies
    @purchase_policies = Spree::PurchasePolicy.all
  end

  def load_purchase_policy_types
    @purchase_policy_types = Spree::PurchasePolicyType.all
  end
end
