SimpleStatus::Application.routes.draw do
  namespace :api do
    resource :current_status, controller: :current_status, only: [:show, :update] do
      put :touch
    end
    resources :messages, only: [:index, :create]
  end

  root to: 'dashboard#index'
end
