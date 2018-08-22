Rails.application.routes.draw do
  resources :abilities
  resources :characters
  resources :costumes
  # resources :avatars
  resources :users do
    resources :avatars
  end

  post'/users/:id/avatars/:id/like', to: 'avatars#likes', as: 'like'
  root 'avatars#home', as: 'home'
  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  post "login", to: "sessions#create", as: "sessions"





  ###STATIC
  # root to: 'static#home'
  # get '/about', to: 'static#about'
  # get '/contact', to: 'static#contact'
  # get '/faq', to: 'static#faq'




##
# authenticate :user do
#   root to: 'home#index', as: :authenticated_root
# end
# root to: redirect('/users/sign_in')
end
