Rails.application.routes.draw do
  get 'competitors/list'
  get 'competitors/selected'
  resources :competitors
  devise_for :users, controllers: { registrations: "users/registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'competitors#index'
end
