# frozen_string_literal: true

module SolidusAddPurchasePoliciesToAdminPanel
  module Spree
    module UserDecorator
      def self.prepended(base)
        base.class_eval do
          has_many :purchase_policies, class_name: 'Spree::PurchasePolicy'
          has_many :purchase_policy_types, class_name: 'Spree::PurchasePolicyType'
        end
      end

      ::Spree.user_class.prepend self
    end
  end
end
