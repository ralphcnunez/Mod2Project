Rails.application.routes.draw do
  # get 'sessions/new'
  resources :abilities
  resources :characters
  resources :costumes
  resources :comments
  # resources :avatars
  resources :users do
    resources :avatars
  end

  post'/users/:id/avatars/:id/like', to: 'avatars#likes', as: 'like'
  root 'avatars#home', as: 'home'
  post "/avatars/:avatar_id/comments", to: "comments#create", as: "create_comment"





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
