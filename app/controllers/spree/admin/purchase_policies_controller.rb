# frozen_string_literal: true

class Spree::Admin::PurchasePoliciesController < Spree::Admin::ResourceController
  helper Spree::BaseHelper
  before_action :load_purchase_policy_types, only: [:edit, :update, :show]

  def index
    @purchase_policies = collection
  end

  def new
    @purchase_policy = Spree::PurchasePolicy.new
    authorize! :create, @purchase_policy
  end

  def create
    @purchase_policy = Spree::PurchasePolicy.new(purchase_policy_params)
    @purchase_policy.user = spree_current_user
    authorize! :create, @purchase_policy
    if @purchase_policy.save
      flash[:notice] = I18n.t('spree.purchase_policy_successfully_submitted')
      redirect_to admin_purchase_policies_path
    end
  end

  def edit
    if @purchase_policy.user.nil?
      flash[:error] = I18n.t('spree.error_no_user')
      redirect_to admin_purchase_policies_path
    end
  end

  def approve
    purchase_policy = Spree::PurchasePolicy.find(params[:id])

    if purchase_policy.update_attribute(:approved, true)
      flash[:success] = I18n.t('spree.info_approve_review')
    else
      flash[:error] = I18n.t('spree.error_approve_review')
    end

    redirect_to admin_purchase_policies_path
  end

  def update
    @purchase_policy = Spree::PurchasePolicy.find(params[:id])
    authorize! :update, @purchase_policy
    if @purchase_policy.update(purchase_policy_params)
      flash[:notice] = I18n.t('spree.update_successfully_submitted')
      redirect_to admin_purchase_policies_path
    else
      render :edit
    end
  end

  def show
  end

  private

  def collection
    params[:q] ||= {}

    @search = Spree::PurchasePolicy.ransack(params[:q])
    @collection = @search.result.includes([:user, :purchase_policy_type]).page(params[:page]).per(params[:per_page])
  end

  def permitted_purchase_policy_attributes
    [:title, :content, :purchase_policy_type_id]
  end

  def purchase_policy_params
    params.require(:purchase_policy).permit(permitted_purchase_policy_attributes)
  end

  def load_purchase_policy_types
    @purchase_policy_types = Spree::PurchasePolicyType.all
  end
end
