# frozen_string_literal: true

Spree::Backend::Config.configure do |config|
  config.menu_items.detect { |menu_item|
    menu_item.label == :products
  }.sections << :purchase_policy_types
end

Deface::Override.new(
  virtual_path: "spree/admin/shared/_product_sub_menu",
  name: "reviews_admin_tab",
  insert_bottom: "[data-hook='admin_product_sub_tabs']",
  disabled: false
) do
  <<-HTML
    <% if can? :admin, Spree::PurchasePolicyType %>
      <%= tab(:purchase_policy_types, label: 'purchase_policy_types_management') %>
    <% end %>
  HTML
end
