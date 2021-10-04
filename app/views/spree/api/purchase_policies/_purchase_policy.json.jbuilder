# frozen_string_literal: true

json.cache! [I18n.locale, purchase_policy] do
  json.call(purchase_policy, *purchase_policy_attributes)
  json.purchase_policy_type(purchase_policy.purchase_policy_type) do |purchase_policy_type|
    json.partial!("spree/api/purchase_policies/purchase_policy_type", purchase_policy_type: purchase_policy_type)
  end
end
