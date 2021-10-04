# frozen_string_literal: true

class Spree::Admin::PurchasePolicyTypesController < Spree::Admin::ResourceController
  belongs_to 'spree/purchase_policy'
  def index
    @collection = parent.purchase_policy_types
  end
end
