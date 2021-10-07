# frozen_string_literal: true

module Spree
  module Api
    class PurchasePolicyTypesController < Spree::Api::BaseController
      respond_to :json

      before_action :load_purchase_policy, only: [:create, :update, :destroy]
      before_action :load_purchase_policy_type, only: [:update, :destroy]
      before_action :find_purchase_policy_type_user

      def index
        @purchase_policy_type = if @user
                     Spree::PurchasePolicyType.default_approval_filter.where(user: @user)
                   else
                     Spree::PurchasePolicyType.where(user: @current_api_user)
                   end

        respond_with(@purchase_policies)
      end

      def show
        authorize! :read, @purchase_policy_type
        render json: @purchase_policy_type, include: [:purchase_policies]
      end

      private

      def find_purchase_policy_type_user
        if params[:user_id] && @current_user_roles.include?('admin')
          @current_api_user = Spree.user_class.find(params[:user_id])
        end
      end

      def load_purchase_policy
        @review = Spree::PurchasePolicy.find(params[:purchase_policy_id])
      end

      def load_purchase_policy_type
        @purchase_policy_type = Spree::PurchasePolicyType.find(params[:id])
      end
    end
  end
end
