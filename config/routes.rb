# frozen_string_literal: true

Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :purchase_policies do
      member do
        get :approve
      end
      resources :purchase_policy_types
    end
    resource :purchase_policy_settings, only: [:edit, :update]
  end
  post '/purchase_policies/:purchase_policy_id/purchase_policy_type(.:format)' => 'purchase_policy_types#create', as: :purchase_policy_types

  if SolidusSupport.api_available?
    namespace :api, defaults: { format: 'json' } do
      resources :purchase_policies, only: [:show, :create, :update, :destroy]

      resources :purchase_policy_types, only: [:create, :update, :destroy]

      resources :users do
        resources :purchase_policies, only: [:index]
      end
    end
  end
end
