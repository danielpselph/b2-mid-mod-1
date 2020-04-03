class ParksController < ApplicationController

    def show
        # binding.pry
        @park = Park.find(params[:id])
    end
    
end