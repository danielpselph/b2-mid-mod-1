require 'rails_helper'

RSpec.describe Mechanic, type: :model do 
    describe "relationships" do
        it { should have_many :park_mechanics }
        it { should have_many(:rides).through(:park_mechanics) }
        
    end
    
end