Rails.application.routes.draw do
  devise_for :users, :controllers => {
    sessions: 'users/sessions',
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  devise_scope :user do
    get 'users/logout_callback', to: 'users/sessions#logout_callback', as: :logout_callback
  end
  
  get 'dashboard/index'
  #root 'users#index'
  resources :users
  root to: 'dashboard#index'
  get 'home' => 'dashboard#home'

  namespace :api do
    namespace :v1 do
      get 'users' => 'users#index'
    end
  end
end
