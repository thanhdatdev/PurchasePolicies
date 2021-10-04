# frozen_string_literal: true

json.purchase_policies(@purchase_policies) do |purchase_policy|
  json.partial!("spree/api/purchase_policies/purchase_policy", purchase_policy: purchase_policy)
end
