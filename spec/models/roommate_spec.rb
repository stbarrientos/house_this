require 'rails_helper'

RSpec.describe Roommate, :type => :model do

  before(:each) do
    @r = Roommate.new(user_id: 1, room_id: 1, accepted: false)
  end

  it "is not valid without a user_id" do
    @r.user_id = nil
    expect(@r).to_not be_valid
  end

  it "is not valid without a room_id" do
    @r.room_id = nil
    expect(@r).to_not be_valid
  end

  it "is not valid without a accepted" do
    @r.accepted = nil
    expect(@r).to_not be_valid
  end

  it "is valid with a user_id, room_id, and accepted" do
    expect(@r).to be_valid
  end
end
