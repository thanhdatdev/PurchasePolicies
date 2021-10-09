# frozen_string_literal: true

module Spree::StoreControllerDecorator
  def self.prepended(base)
    base.include LoadPurchasePolicies
  end

  private

  Spree::StoreController.prepend self
end
