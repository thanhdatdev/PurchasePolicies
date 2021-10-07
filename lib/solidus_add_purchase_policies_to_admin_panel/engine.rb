# frozen_string_literal: true

require 'solidus_core'
require 'solidus_support'

module SolidusAddPurchasePoliciesToAdminPanel
  class Engine < Rails::Engine
    include SolidusSupport::EngineExtensions

    isolate_namespace ::Spree

    engine_name 'solidus_add_purchase_policies_to_admin_panel'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    if SolidusSupport.api_available?
      paths["app/controllers"] << "lib/controllers"
    end
  end
end
