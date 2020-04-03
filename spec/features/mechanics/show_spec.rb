require 'rails_helper'

RSpec.describe "mechanics show page" do
    describe "as a user" do
        before(:each) do 

            @park1 = Park.create(name: "Danger Zone", price: "10.00")
            @ride1 = @park1.rides.create(name: "Certain Death", rating: 10)
            @ride2 = @park1.rides.create(name: "Big Drop", rating: 8)
            @ride3 = @park1.rides.create(name: "Waiting in Line", rating: 3)
            @mechanic1 = Mechanic.create(name: "Bill Bobson", experience: "5 years")
            @ride_mechanic1 = RideMechanic.create(ride: @ride1, mechanic: @mechanic1)
            @ride_mechanic2 = RideMechanic.create(ride: @ride2, mechanic: @mechanic1)
        end

        it "can see name, experience and rides they are working on" do
            
            visit "/mechanics/#{@mechanic1.id}"

            expect(page).to have_content("Bill Bobson") 
            expect(page).to have_content("5 years") 
            expect(page).to have_content("Certain Death") 
            expect(page).to have_content("Big Drop") 
        end

        it "can see a form to add a new ride to workload" do
            
            visit "/mechanics/#{@mechanic1.id}"

            expect(page).to have_content("Add Ride to Workload") 

            fill_in "Ride",	with: "#{@ride3.id}" 

            click_on "Add to Workload"

            expect(page).to have_content("#{@ride3.name}") 

        end
    end
end


# And I also see a form to add a ride to their workload
# When I fill in that field with an id of an existing ride and hit submit
# I’m taken back to that mechanics show page
# And I see the name of that newly added ride on this mechanics show page
 
# Ex: 
 
# Mechanic: Kara Smith
# Years of Experience: 11
 
# Current rides they’re working on: 
# The Frog Hopper 
# Fahrenheit 
# The Kiss Raise
 
# Add a ride to workload: 
#  _pretent_this_is_a_textfield_
#                        Submit