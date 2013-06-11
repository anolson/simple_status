SimpleStatus::Application.routes.draw do
  namespace :api do
    resource :current_status, controller: :current_status, only: :update
  end

  root to: 'dashboard#index'
end
