class PokemonsController < ApplicationController


    
    # GET /pokemons
    def index
        @pokemons = Pokemon.all
        render json: @pokemons
    end

    # POST /pokemons
    def create
        @pokemon = Pokemon.create!(pokemon_params)
        if @pokemon.save
            render json: @pokemon
        end
    end

    # GET /pokemons/:id
    def show
        find_pokemon
        render json: @pokemon
    end

    # PUT /pokemons/:id
    def update
        find_pokemon
        @pokemon.update(pokemon_params)
        render json: {
            message: "#{@pokemon.name} a été mis à jour",
            data: @pokemon
        }
    end

    # DELETE /pokemons/:id
    def destroy
        find_pokemon
        @pokemon.destroy
        # head :no_content
        render json: {
            message: 'Le pokemon sélectionné a été supprimé'
        }
        
    end

    def pokemon_params
        params.permit(:id, :name, :type1, :type2, :total, :hp, :attack, :defense, :sp_atk, :sp_def, :speed, :generation, :legendary)
    end

    def find_pokemon
        @pokemon = Pokemon.find(params[:id])
    end

end
