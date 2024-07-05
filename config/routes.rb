Rails.application.routes.draw do

  namespace :consumer do
    get 'homes/top'
  end
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

    end

    scope module: :consumer do
      root to: 'homes#top'
    end

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
