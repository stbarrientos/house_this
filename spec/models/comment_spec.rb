require 'rails_helper'

RSpec.describe Comment, :type => :model do

  before(:each) do
    @comment = Comment.new
  end

  it "will not be valid without a body" do
    @comment.user_id = 1
    @comment.place_id = 2
    expect(@comment).to_not be_valid
  end

  it "will not be valid without a user_id" do
    @comment.body = "Hello"
    @comment.place_id = 2
    expect(@comment).to_not be_valid
  end

  it "will not be valid without a place_id" do
    @comment.user_id = 1
    @comment.body = "Hello"
    expect(@comment).to_not be_valid
  end

  it "will be valid with a user_id, place_id, and body" do
    @comment.user_id = 1
    @comment.place_id = 2
    @comment.body= "Hello"
    expect(@comment).to be_valid
  end
end
