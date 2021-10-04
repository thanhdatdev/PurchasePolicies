# frozen_string_literal: true

module Spree
  class PurchasePolicyType < ApplicationRecord
    belongs_to :user, class_name: Spree.user_class.to_s, optional: true

    has_many   :purchase_policies, dependent: :destroy

    scope :most_recent_first, -> { order("spree_purchase_policy_types.created_at DESC") }
    default_scope { most_recent_first }
  end
end
