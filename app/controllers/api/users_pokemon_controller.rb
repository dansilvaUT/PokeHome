require_relative '../../services/pokemon_service';

class Api::UsersPokemonController < ApplicationController

    def search_pokemon
        pokemon_service = PokemonService.new

        @pokemon = pokemon_service.fetch_pokemon_by_name(params[:name])

        if @pokemon
            render json: @pokemon, status: :ok
        else
             render json: { error: @pokemon[:message] }, status: :unprocessable_entity
        end
    end
end
