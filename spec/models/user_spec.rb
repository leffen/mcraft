require 'spec_helper'

describe User do
  let!(:user) { FactoryGirl.create(:user)}

  it "should be savable" do
    user.save
  end

  it "should be confirmable" do
    user.confirm!
  end


end
