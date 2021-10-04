# frozen_string_literal: true

class Spree::Admin::PurchasePolicySettingsController < Spree::Admin::BaseController
  before_action :process_unset_checkboxes, only: [:update]

  def update
    Spree::SolidusAddPurchasePoliciesToAdminPanel::Config.set(params[:preferences])

    respond_to do |format|
      format.html do
        redirect_to edit_admin_purchase_policy_settings_path
      end
    end
  end

  def process_unset_checkboxes
    # workaround for unset checkbox behaviour
    params[:preferences] ||= {}
    Spree::PurchasePoliciesConfiguration.boolean_preferences.each do |sym|
      params[:preferences][sym] = false if params[:preferences][sym].blank?
    end
  end
end
