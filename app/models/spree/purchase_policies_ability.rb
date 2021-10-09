# frozen_string_literal: true

class Spree::PurchasePoliciesAbility
  include CanCan::Ability

  def initialize(user)
    purchase_policy_ability_class = self.class

    can :read, Spree::PurchasePolicy do |purchase_policy|
      purchase_policy.user == user || purchase_policy.approved?
    end

    can :read, Spree::PurchasePolicyType do |purchase_policy_types|
      purchase_policy_types.user == user
    end
  end
end
