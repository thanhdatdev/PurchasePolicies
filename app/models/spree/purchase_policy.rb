# frozen_string_literal: true

class Spree::PurchasePolicy < ApplicationRecord
  belongs_to   :user, class_name: Spree.user_class.to_s, optional: true
  belongs_to   :purchase_policy_type
  before_save  :approve_purchase_policy, unless: :approved?
  default_scope { order("spree_purchase_policies.created_at DESC") }

  scope :approved, -> { where(approved: true) }
  scope :not_approved, -> { where(approved: false) }
  scope :default_approval_filter, -> { Spree::SolidusAddPurchasePoliciesToAdminPanel::Config[:include_unapproved_purchase_policies] ? all : approved }

  def email
    user&.email
  end

  def star_only?
    [title, content, purchase_policy_type].all?(&:blank?)
  end

  def approve_purchase_policy
    if Spree::SolidusAddPurchasePoliciesToAdminPanel::Config[:approve_star_only]
      self.approved = true if star_only?
    end
  end
end
