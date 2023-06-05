require 'httparty'

class PokemonService
    def fetch_pokemon_by_name(name)
        begin
            pokemon_response = HTTParty.get("https://pokeapi.co/api/v2/pokemon/#{name}")
            if pokemon_response.success?
                data = JSON.parse(pokemon_response.body)
                render { pokemon: data, status: :ok }
            end
        rescue  StandardError => e
            puts "An error occurred: #{e.message}"
            { status: :error, message: e.message }
        end
    end
  end