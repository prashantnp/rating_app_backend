Rails.application.routes.draw do
  root to: 'questions#index'
  resources :questions, only: [:index, :destroy, :create, :show, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
