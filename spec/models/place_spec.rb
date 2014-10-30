require 'rails_helper'

RSpec.describe Place, :type => :model do
  
  before(:each) do
    @place = Place.new(address: "123 Test Way", url: "google.com", room_id: 1, rank: 1, price: 1234, beds: 3, baths: 3, sqft: 2000, amenities: "Wifi")
  end

  it "is not valid without a url" do
    @place.url = nil
    expect(@place).to_not be_valid
  end

  it "is not valid without a room_id" do
    @place.room_id = nil
    expect(@place).to_not be_valid
  end

  it "is not valid without an address" do
    @place.address = nil
    expect(@place).to_not be_valid
  end

  it "is valid without a price" do
    @place.price = nil
    expect(@place).to be_valid
  end

  it "is valid without a beds" do
    @place.beds = nil
    expect(@place).to be_valid
  end

  it "is valid without a baths" do
    @place.baths = nil
    expect(@place).to be_valid
  end

  it "is valid without a sqft" do
    @place.sqft = nil
    expect(@place).to be_valid
  end

  it "is valid without amenities" do
    @place.amenities = nil
    expect(@place).to be_valid
  end
end
