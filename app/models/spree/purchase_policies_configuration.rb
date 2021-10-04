# frozen_string_literal: true

class Spree::PurchasePoliciesConfiguration < Spree::Preferences::Configuration
  def self.boolean_preferences
    %w(display_unapproved_reviews include_unapproved_reviews show_email require_login)
  end

  # include non-approved reviews in (public) listings
  preference :include_unapproved_purchase_policies, :boolean, default: false

  # displays non-approved reviews in (public) listings
  preference :display_unapproved_purchase_policies, :boolean, default: false

  preference :show_email, :boolean, default: false

  preference :require_login, :boolean, default: true

  preference :approve_star_only, :boolean, default: false
end
