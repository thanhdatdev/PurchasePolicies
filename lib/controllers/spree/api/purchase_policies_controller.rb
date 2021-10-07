# frozen_string_literal: true

module Spree
  module Api
    class PurchasePoliciesController < Spree::Api::BaseController
      respond_to :json

      before_action :load_purchase_policy, only: [:show, :update, :destroy]
      before_action :find_purchase_policy_user

      def index
        @purchase_policies = if @user
                     Spree::PurchasePolicy.default_approval_filter.where(user: @user)
                   else
                     Spree::PurchasePolicy.where(user: @current_api_user)
                   end

        respond_with(@purchase_policies)
      end

      def show
        authorize! :read, @purchase_policy
        render json: @purchase_policy, include: [:purchase_policy_type]
      end

      private

      def find_purchase_policy_user
        if params[:user_id] && @current_user_roles.include?('admin')
          @current_api_user = Spree.user_class.find(params[:user_id])
        end
      end

      def load_purchase_policy
        @purchase_policy = Spree::PurchasePolicy.find(params[:id])
      end
    end
  end
end
