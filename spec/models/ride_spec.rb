require 'rails_helper'

RSpec.describe Ride, type: :model do 
    describe "relationships" do
        it { should belong_to :park }
        it { should have_many :park_mechanics }
        it { should have_many(:mechanics).through(:park_mechanics) }
    end
    
end