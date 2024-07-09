Rails.application.routes.draw do
  namespace :consumer do
    get 'shops/index'
    get 'shops/show'
  end
  scope "(:locale)" do
    devise_for :makers, skip: [:passwords], controllers: {
      registrations: 'seller/registrations',
      sessions: 'seller/sessions'
    }
    devise_for :users, skip: [:passwords], controllers: {
      registrations: 'consumer/registrations',
      sessions: 'consumer/sessions'
    }

    namespace :seller do
      get "information/edit", to: "makers#edit", as: "edit_maker"
      resources :makers, only: [:update, :destroy]
      resources :shops, only: [:index, :create, :show, :edit, :update, :destroy]
    end

    scope module: :consumer do
      root to: 'homes#top'
      get "users/information/edit", to: "users#edit", as: "edit_user"
      resources :users, only: [:update, :destroy] do
        resources :records, only: [:create, :show, :edit, :update, :destroy]
      end
      resources :shops, only: [:index, :show]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
