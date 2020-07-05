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
  root 'public#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  authenticate :admin do
    namespace :admin do
      resources :quizs, only: [:index, :show]
      resources :users, only: [:index, :show]
      resources :categories
    end
  end

  scope module: :public do
    get '/about'  => 'public#about'
    get '/privary_policy'  => 'public#privary_policy'
    get '/terms'  => 'public#terms'
    resources :contacts, only: [:new]
    resources :quizs, only: [:index, :show]
    resources :users, only: :show
  end

  authenticate :user do
    namespace :user do
      resource :user_profile, path: :profile, only: [:edit, :update]
      resources :quizs, except: :show do
        resources :favorites, only: [:create, :destroy]
      end
    end
  end
end
