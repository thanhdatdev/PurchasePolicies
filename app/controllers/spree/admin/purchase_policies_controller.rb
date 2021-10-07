# frozen_string_literal: true

class Spree::Admin::PurchasePoliciesController < Spree::Admin::ResourceController

  belongs_to 'spree/purchase_policy_type'
  def index
    @purchase_policies = collection
  end

  def approve
    purchase_policies = Spree::PurchasePolicy.find(params[:id])

    if review.update_attribute(:approved, true)
      flash[:success] = I18n.t('spree.info_approve_purchase_policy')
    else
      flash[:error] = I18n.t('spree.error_approve_purchase_policy')
    end

    redirect_to admin_purchase_policies_path
  end

  def edit
    if @purchase_policies.user.nil?
      flash[:error] = I18n.t('spree.error_no_user')
      redirect_to admin_purchase_policies_path
    end
  end

  private

  def collection
    params[:q] ||= {}

    @search = Spree::PurchasePolicy.ransack(params[:q])
    @collection = @search.result.includes([:user, :purchase_policy_type]).page(params[:page]).per(params[:per_page])
  end
end
