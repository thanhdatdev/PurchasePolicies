# frozen_string_literal: true

Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :purchase_policies do
      member do
        get :approve
      end
    end
    resources :purchase_policy_types
    resource :purchase_policy_settings, only: [:edit, :update]
  end
  # post '/purchase_policy_types/:purchase_policy_type_id/purchase_policies' => 'purchase_policy_types#show', as: :show_all_purchase_policies

  resources :purchase_policy_types, only: [:index] do
    resources :purchase_policies, only: [:show]
  end
end
