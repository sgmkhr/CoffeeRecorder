Rails.application.routes.draw do

  devise_for :makers, skip: [:passwords], controllers: {
    registrations: 'seller/registrations',
    sessions: 'seller/sessions'
  }
  devise_for :users, skip: [:passwords], controllers: {
    registrations: 'consumer/registrations',
    sessions: 'consumer/sessions'
  }

  scope "(:locale)" do

    namespace :seller do
      get "information/edit", to: "makers#edit", as: "edit_maker"
      resources :makers, only: [:update, :destroy]
    end

    scope module: :consumer do
      root to: 'homes#top'
      get "users/information/edit", to: "users#edit", as: "edit_user"
      resources :users, only: [:update, :destroy]
    end

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
