# frozen_string_literal: true

json.cache! [I18n.locale, purchase_policy_type] do
  json.call(purchase_policy_type, *purchase_policy_type_attributes)
end
