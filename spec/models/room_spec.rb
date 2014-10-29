require 'rails_helper'

RSpec.describe Room, :type => :model do
  it "does not save rooms without a name" do
    room = Room.new
    expect(room).to_not be_valid
  end
end
