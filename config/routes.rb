Rails.application.routes.draw do
  resources :abilities
  resources :characters
  resources :costumes
  resources :avatars
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
