Rails.application.routes.draw do
  root 'home#show'
  get '/auth/github/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :user, path: ':user' do
    get '/dashboard', to: 'dashboard#index'
    get '/repos', to: 'repos#index'
    get '/events', to: 'events#index'
    get '/organizations', to: 'organizations#index'
    get '/starred', to: 'starred_repos#index'
    get '/followers', to: 'followers#index'
    get '/following', to: 'following#index'
    get '/received_events', to: 'received_events#index'
  end
end
