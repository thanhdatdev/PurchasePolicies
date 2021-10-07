# frozen_string_literal: true

class Spree::Admin::PurchasePolicyTypesController < Spree::Admin::ResourceController
  def index
    @collection = parent.purchase_policy_types
  end
end
