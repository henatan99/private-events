Rails.application.routes.draw do
  resources :users, only: %i[new create destroy]
  resources :sessions, only: %i[new create destroy]
  resources :events, only: %i[new create index destroy edit show update]
  root to: 'events#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
