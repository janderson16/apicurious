Rails.application.routes.draw do
  root 'home#show'
  get  '/dashboard', to: 'dashboard#show'
  get '/auth/github/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  # get '/followers', to: 'followers#index'
  # get '/following', to: 'following#index'
  # get '/repos', to: 'repos#index'

  namespace :user, path: ':user' do
    get '/followers', to: 'followers#index'
    get '/following', to: 'following#index'
    get '/repos', to: 'repos#index'
    get '/organizations', to: 'organizations#index'
  end
end
