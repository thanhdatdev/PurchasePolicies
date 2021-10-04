# frozen_string_literal: true

require 'spree/core'

module SolidusAddPurchasePoliciesToAdminPanel
  class Engine < Rails::Engine
    include SolidusSupport::EngineExtensions

    isolate_namespace Spree

    engine_name 'solidus_add_purchase_policies_to_admin_panel'


    config.to_prepare do
      ::Spree::Ability.register_ability(::Spree::PurchasePoliciesAbility)
    end

    if SolidusSupport.api_available?
      paths["app/controllers"] << "lib/controllers"
    end
  end
end
