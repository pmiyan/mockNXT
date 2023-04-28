Rails.application.routes.draw do
  devise_for :users, :controllers => {
    sessions: 'users/sessions',
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  
  get 'dashboard/index'
  #root 'users#index'
  #resources :users
  root to: 'dashboard#index'
  get 'home' => 'dashboard#home'
end
