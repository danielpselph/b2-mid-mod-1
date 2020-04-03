class RideMechanicsController < ApplicationController

    def create
        ride = Ride.find(params[:id])
        mechanic = Mechanic.find(params[:id])
    end
end