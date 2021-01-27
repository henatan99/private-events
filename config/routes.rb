Rails.application.routes.draw do
  resources :users
  resources :sessions, only: %i[new create destroy]
  resources :events, only: %i[new create index]
  root to: 'events#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
