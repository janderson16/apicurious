Rails.application.routes.draw do
  root 'home#show'
  get  '/dashboard', to: 'dashboard#show'
  get '/auth/github/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :user, path: ':user' do
    get '/repos', to: 'repos#index'
    get '/events', to: 'events#index'
    get '/organizations', to: 'organizations#index'
    get '/starred', to: 'starred_repos#index'
    get '/followers', to: 'followers#index'
    get '/following', to: 'following#index'
    get '/following_events', to: 'events#show'
  end
end
