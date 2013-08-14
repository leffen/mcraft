require 'spec_helper'

describe Avatar do
  it "savable" do
    a = FactoryGirl.build(:avatar)
    a.save
  end

  it "findable" do
    random_avatar = FactoryGirl.create(:random_avatar)
    Avatar.find(random_avatar.id).id.should == random_avatar.id
  end
end
