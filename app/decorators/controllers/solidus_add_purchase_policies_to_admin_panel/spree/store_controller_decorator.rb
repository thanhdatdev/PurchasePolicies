# frozen_string_literal: true

module Spree
  module StoreControllerDecorator
    def self.prepended(base)
      base.include LoadPurchasePolicies
    end
    Spree::StoreController.prepend self
  end
end
