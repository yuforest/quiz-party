Rails.application.routes.draw do
  devise_for :admins, skip: :all
  devise_scope :admin do
    get 'admins/sign_in'    => 'admins/sessions#new', as: :new_admin_session
    post 'admins/sign_in'    => 'admins/sessions#create', as: :admin_session
    delete 'admins/sign_out' => 'asmins/sessions#destroy',  as: :destroy_admin_session
  end
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root 'static#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  authenticate :admin do
    namespace :admin do
      resources :quizzes, only: [:index]
      resources :users, only: [:index, :destroy]
      resources :categories, except: [:show]
    end
  end

  get '/about'  => 'static#about'
  get '/privacy_policy'  => 'static#privacy_policy'
  get '/terms'  => 'static#terms'
  get '/operator'  => 'static#operator'

  scope module: :public do
    resource :ogp_images, only: [:show]
    resources :quizzes, only: [:index, :show] do
      resources :responses, only: [:index, :create]
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
