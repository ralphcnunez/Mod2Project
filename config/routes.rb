Rails.application.routes.draw do
  resources :abilities
  resources :characters
  resources :costumes
  # resources :avatars
  resources :users do
  resources :avatars
  end
  #
  # post'/users/:id/avatars/:id/like', to: 'avatars#likes', as: 'like'
  # root 'avatars#home', as: 'home'

#   ##
#   get 'users/new', to: 'users_sessions#new', as: 'users_login'
# post 'user/login', to: 'users_sessions#create'
# delete '/user/logout', to: 'users_sessions#destroy', as: 'users_logout'
#
# get '/user/profile', to: 'users#profile', as: 'users_profile'
# get '/user/profile/edit', to: 'users#edit', as: 'users_edit_profile'


  ###STATIC
  # root to: 'static#home'
  # get '/about', to: 'static#about'
  # get '/contact', to: 'static#contact'
  # get '/faq', to: 'static#faq'

end


##
# authenticate :users do
#   root to: 'home#index', as: :authenticated_root
# end
# root to: redirect('/userss/sign_in')
