Rails.application.routes.draw do
  scope "(:locale)" do
    devise_for :makers, skip: [:passwords], controllers: {
      registrations: 'seller/registrations',
      sessions: 'seller/sessions'
    }
    devise_for :users, skip: [:passwords], controllers: {
      registrations: 'consumer/registrations',
      sessions: 'consumer/sessions'
    }

    devise_scope :maker do
      post "makers/guest_sign_in", to: "seller/sessions#guest_sign_in"
    end

    devise_scope :user do
      post "users/guest_sign_in", to: "consumer/sessions#guest_sign_in"
    end

    namespace :seller do
      get "(:id)/information/edit", to: "makers#edit", as: "edit_maker"
      resources :makers, only: [:update, :destroy]
      resources :shops, only: [:index, :create, :show, :edit, :update, :destroy] do
        resources :coffee_posts, except: [:index]
        resources :information_posts, except: [:index]
      end
    end

    scope module: :consumer do
      root to: 'homes#top'
      get "users/(:id)/information/edit", to: "users#edit", as: "edit_user"
      resources :users, only: [:update, :destroy] do
        resources :records, only: [:create, :show, :edit, :update, :destroy]
      end
      resources :shops, only: [:index, :show] do
        resources :coffee_posts, only: [:show]
        resources :information_posts, only: [:show]
      end
      resources :coffee_posts, only: [:index]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
