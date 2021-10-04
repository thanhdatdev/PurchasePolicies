# frozen_string_literal: true

class Spree::PurchasePoliciesAbility
  include CanCan::Ability

  def initialize(user)
    purchase_policy_ability_class = self.class

    can :create, Spree::PurchasePolicy do |_purchase_policy|
      purchase_policy_ability_class.allow_anonymous_purchase_policies? || user.email.present?
    end

    can :create, Spree::PurchasePolicyType do |_purchase_policy|
      purchase_policy_class.allow_anonymous_purchase_policies? || user.email.present?
    end

    # You can only change your own feedback_review
    can [:edit, :update, :destroy], Spree::PurchasePolicyType do |purchase_policy_type|
      purchase_policy_type.user == user
    end

    # You can read your own reviews, and everyone can read approved ones
    can :read, Spree::PurchasePolicy do |purchase_policy|
      purchase_policy.user == user || purchase_policy.approved?
    end

    # You can only change your own review
    can [:edit, :update, :destroy], Spree::PurchasePolicy do |purchase_policy|
      purchase_policy.user == user
    end
  end

  def self.allow_anonymous_purchase_policies?
    !Spree::SolidusAddPurchasePoliciesToAdminPanel::Config[:require_login]
  end
end
