Rails.application.routes.draw do

  namespace :api do
    get 'search_pokemon', to: 'users_pokemon#search_pokemon'
  end
end
