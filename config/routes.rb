SimpleStatus::Application.routes.draw do
  namespace :api do
    resource :current_status, controller: :current_status, only: :update
    resources :messages, only: [:index, :create]
  end

  root to: 'dashboard#index'
end
