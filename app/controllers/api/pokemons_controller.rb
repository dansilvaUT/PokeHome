require_relative '../../services/pokemon_service';

class Api::PokemonsController < ApplicationController
    include UserModule
    before_action :logged_in_user, only: [:save_pokemon]
    before_action :authorized_user?, only: [:release_pokemon]

    def search_pokemon
        pokemon_service = PokemonService.new

        @pokemon = pokemon_service.fetch_pokemon_by_name(params[:name])

        if @pokemon
            render json: { pokemon: @pokemon }, status: :ok
        
        else
             render json: { error: @pokemon[:message] }, status: :unprocessable_entity
        end
    end

    def save_pokemon
        @pokemon = Pokemon.new(pokemon_params)
        if @pokemon.save
            render json: { message: "Pokemon saved" }
        else
            render json: { message: "Something went wrong" }, status: :unprocessable_entity
        end
    end

    def release_pokemon
        @pokemon = Pokemon.find_by(id: params[:id])
        if @pokemon && @pokemon.user_id == current_user.id
            @pokemon.destroy
            render json: { message: "Pokemon released" }
        else
            render json: { message: "Something went wrong" }, status: :unprocessable_entity
        end
    end

    private

    def pokemon_params
        params.require(:pokemon).permit(:name, :dex_id,  :user_id, moves: {}, images: {})
    end
end