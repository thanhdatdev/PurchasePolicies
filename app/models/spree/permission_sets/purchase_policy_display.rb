# frozen_string_literal: true

module Spree
  module PermissionSets
    class PurchasePolicyDisplay < PermissionSets::Base
      def activate!
        can [:display, :admin], Spree::PurchasePolicy
      end
    end
  end
end
