Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  root 'static#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  authenticate :admin do
    namespace :admin do
      resources :quizzes, only: [:index, :show]
      resources :users, only: [:index, :show]
      resources :categories
    end
  end

  get '/about'  => 'static#about'
  get '/privacy_policy'  => 'static#privacy_policy'
  get '/terms'  => 'static#terms'
  get '/operator'  => 'static#operator'

  scope module: :public do
    resource :ogp_images, only: [:show]
    resources :contacts, only: [:new]
    resources :quizzes, only: [:index, :show] do
      resources :responses, only: [:index, :show]
    end
    scope module: :categories do
      resources :categories, param: :slug, only: [] do
        resources :quizzes, only: [:index]
      end
    end
    resources :users, only: :show
  end

  authenticate :user do
    namespace :user do
      resource :user_profile, path: :profile, only: [:edit, :update]
      resources :quizzes, except: :show
    end
  end
end
