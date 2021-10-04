# frozen_string_literal: true

module SolidusAddPurchasePoliciesToAdminPanel
  module Spree
    module UserDecorator
      def self.prepended(base)
        base.class_eval do
          has_many :purchase_policies, class_name: 'Spree::PurchasePolicy'
        end
      end

      ::Spree.user_class.prepend self
    end
  end
end
