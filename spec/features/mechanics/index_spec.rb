require 'rails_helper'

RSpec.describe "mechanic index page" do
    describe "as a user" do
        it "can see a list of all mechanics and their years of experience" do

            mechanic1 = Mechanic.create(name: "Bill Bobson", experience: "5 years")
            mechanic2 = Mechanic.create(name: "Susan Sharon", experience: "50 years")
            mechanic3 = Mechanic.create(name: "Frank Andrews", experience: "1 week")

            visit '/mechanics'

            expect(page).to have_content("All Mechanics") 
            
            within "#mechanic-#{mechanic1.id}" do 
                expect(page).to have_content("Bill Bobson") 
                expect(page).to have_content("5 years") 
            end

            within "#mechanic-#{mechanic2.id}" do 
                expect(page).to have_content("Susan Sharon") 
                expect(page).to have_content("50 years") 
            end

            within "#mechanic-#{mechanic3.id}" do 
                expect(page).to have_content("Frank Andrews") 
                expect(page).to have_content("1 week") 
            end
        end
    end
end


# Story 1
# As a user, 
# When I visit a mechanics index page
# I see a header saying “All Mechanics”
# And I see a list of all mechanic’s names and their years of experience
 
 
# Ex: 
#               All Mechanics
 
#     Sam Mills - 10 years of experience 
#     Kara Smith - 11 years of experience
 