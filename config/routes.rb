Rails.application.routes.draw do
  resources :abilities
  resources :characters
  resources :costumes
  # resources :avatars
  resources :users do
    resources :avatars

    post'/users/:id/avatars/:id/like', to: 'avatars#likes', as: 'like'
  end




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
