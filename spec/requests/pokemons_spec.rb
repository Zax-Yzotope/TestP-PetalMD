require 'rails_helper'

RSpec.describe "Pokemon API", type: :request do          
      
        it 'returns pokemons' do
            get "/pokemons/"
            expect(response.content_type).to include "application/json"
            expect(response.status).to eq(200)
        end

        it 'create pokemon' do
            params = {name: "GrosMachin"}
            post "/pokemons", params: params
            pokemon = Pokemon.last
            expect(pokemon.name).to eq("GrosMachin")
        end

        it 'delete the last one' do
            id = Pokemon.last.id
            delete "/pokemons/#{id}"
            pokemon = Pokemon.last
            expect(pokemon.id).to eq(id-1)
        end

        it 'change '
    

end