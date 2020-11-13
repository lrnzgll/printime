Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'pages/logout', to: 'pages#logout'

  resources :jobs do
    resources :exports
  end

  get 'exports', to: 'exports#home', as: 'exports'

  resources :periods
  get 'jobs/::id/delete',  to: 'jobs#destroy_intention', as: 'destroy_intention_job'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
