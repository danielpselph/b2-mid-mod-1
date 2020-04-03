require 'rails_helper'

RSpec.describe "park show page" do
    describe "as a visitor" do
        before(:each) do
            @park1 = Park.create(name: "Danger Zone", price: "10.00")
            @ride1 = @park1.rides.create(name: "Certain Death", rating: 10)
            @ride2 = @park1.rides.create(name: "Big Drop", rating: 8)
            @ride3 = @park1.rides.create(name: "Waiting in Line", rating: 3)
        end 
        
        it "can see name and price" do
            
            visit "/parks/#{@park1.id}"

            expect(page).to have_content("Danger Zone") 
            expect(page).to have_content("10.00") 
        end

        it "can see rides listed in alphabetical order and average thrill rating" do
            
            visit "/parks/#{@park1.id}"

            expect(page).to have_content("Average Thrill Rating: 7") 
            expect(page).to have_content("Certain Death") 
            expect(page).to have_content("Big Drop") 
            expect(page).to have_content("Waiting in Line") 
            
        end
    end
end


# Story 2
# As a visitor, 
# When I visit an amusement park’s show page
# I see the name and price of admissions for that amusement park
# And I see the names of all the rides that are at that theme park listed in alphabetical order
# And I see the average thrill rating of this amusement park’s rides
 
# Ex: Hershey Park
#     Admissions: $50.00
       
#     Rides: 
#            1. Lightning Racer 
#            2. Storm Runner
#            3. The Great Bear 
 
#     Average Thrill Rating of Rides: 7.8/10
       