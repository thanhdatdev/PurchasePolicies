# frozen_string_literal: true

module Spree
  module PermissionSets
    class PurchasePolicyManagement < PermissionSets::Base
      def activate!
        can :manage, Spree::PurchasePolicy
      end
    end
  end
end
