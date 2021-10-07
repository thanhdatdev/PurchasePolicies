# frozen_string_literal: true

module SolidusAddPurchasePoliciesToAdminPanel
  module Spree
    module Api
      module ApiHelpersDecorator
        def self.prepended(base)
          base.module_eval do
            @@purchase_policy_attributes = [
              :id, :title, :content, :approved,
              :created_at, :updated_at, :user_id, :purchase_policy_type_id
            ]

            @@purchase_policy_type_attributes = [
              :id, :user_id, :purchase_policy_id, :name , :created_at, :updated_at
            ]

            def purchase_policy_attributes
              @@review_attributes
            end

            def purchase_policy_type_attributes
              @@feedback_review_attributes
            end
          end
        end

        ::Spree::Api::ApiHelpers.prepend self
      end
    end
  end
end
