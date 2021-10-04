# frozen_string_literal: true

module Spree
  module Admin
    class PurchasePoliciesController < Spree::Admin::ResourceController
      before_action :load_user, only: [:index, :new, :create, :edit, :update]

      def index
        @approved_purchase_policies = Spree::PurchasePolicy.approved.where(user: @user)
      end

      def new
        @purchase_policy = Spree::PurchasePolicy.new(user: @user)
        authorize! :create, @user
      end

      def edit
        @purchase_policy = Spree::PurchasePolicy.find(params[:id])
        if @purchase_policy.user.nil?
          flash[:error] = I18n.t('spree.error_no_user')
        end
        authorize! :update, @purchase_policy
      end

      # save if all ok
      def create
        @purchase_policy = Spree::PurchasePolicy.new(purchase_policy_params)
        @purchase_policy.user = spree_current_user if spree_user_signed_in?
        authorize! :create, @purchase_policy
        if @purchase_policy.save
          flash[:notice] = I18n.t('spree.purchase_policy_successfully_submitted')
          redirect_to spree.user_path(@user)
        else
          render :new
        end
      end

      def update
        @purchase_policy = Spree::PurchasePolicy.find(params[:id])

        authorize! :update, @purchase_policy
        if @purchase_policy.update(purchase_policy_params)
          flash[:notice] = I18n.t('spree.purchase_policy_successfully_submitted')
          redirect_to spree.user(@user)
        else
          render :edit
        end
      end

      private

      def load_user
        @user = Spree::User.friendly.find(params[:user_id])
      end

      def permitted_purchase_policy_attributes
        [:purchase_policy_title, :purchase_policy_content]
      end

      def purchase_policy_params
        params.require(:purchase_policy).permit(permitted_purchase_policy_attributes)
      end

      def render_after_create_error
        flash.keep
        redirect_to request.referer
      end

      def location_after_save
        request.referer
      end
    end
  end
end
