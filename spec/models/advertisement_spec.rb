require 'rails_helper'

RSpec.describe Advertisement, type: :model do
     let(:advertisement) { Advertisement.create!(title: "New Post Title", body: "New Post Body", price: 100) }

   describe "attributes" do
     it "has title and body attributes" do
       expect(advertisement).to have_attributes(title: "New Post Title", body: "New Post Body", price: 100)
     end
   end
end
