require 'httparty'

class PokemonService
    def fetch_pokemon_by_name(name)
        begin
            pokemon_response = HTTParty.get("https://pokeapi.co/api/v2/pokemon/#{name}")
            if pokemon_response.success?
                data = JSON.parse(pokemon_response.body)
            else
                { status: :error, message: "Request failed with status code: #{pokemon_response.code}" }
            end
        rescue  StandardError => e
            { status: :error, message: e.message }
        end
    end
  end