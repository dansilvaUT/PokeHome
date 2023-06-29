Rails.application.routes.draw do

  namespace :api do
    #Fetch Pokemon
    get 'search_pokemon', to: 'pokemons#search_pokemon'
    post "save_pokemon", to: "pokemons#save_pokemon"
    delete "release_pokemon", to: "pokemons#release_pokemon"
    #Users
    post 'create_user', to: 'users#create'
    put 'update_user_profile_img', to: 'users#update_user_profile_img'
    #Sessions
    post 'create_session', to: 'sessions#create_session'
    post "/logout", to: "sessions#destroy_session"
    get "/logged_in", to: "sessions#is_logged_in?"
  end
end
