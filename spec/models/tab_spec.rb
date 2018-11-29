require 'rails_helper'

RSpec.describe Tab, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:text_components) }

    it { should belong_to(:topic) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
