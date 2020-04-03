class MechanicsController < ApplicationController

    def index
        @mechanics = Mechanic.all
    end

    def show 
        # binding.pry
        @mechanic = Mechanic.find(params[:id])
    end
end