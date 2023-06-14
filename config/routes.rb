Rails.application.routes.draw do

  namespace :api do
    #Fetch Pokemon
    get 'search_pokemon', to: 'users_pokemon#search_pokemon'
    #Users
    post 'create_user', to: 'users#create'
    #Sessions
    post 'create_session', to: 'sessions#create_session'
    post "/logout", to: "sessions#destroy_session"
    get "/logged_in", to: "sessions#is_logged_in?"
  end
end
