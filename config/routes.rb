Rails.application.routes.draw do
  resources :users, only: %i[new create destroy]
  resources :sessions, only: %i[new create destroy]
	resources :events do
    member do
      get 'invitation'
      get 'cancel_invitation'
		end
	end
	resources :attendances, only: %i[new create destroy]
  root to: 'events#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
