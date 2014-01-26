require 'spec_helper'

describe AvatarController do
  let!(:avatar) { FactoryGirl.create(:random_avatar) }
  let(:avatar_attrs) { FactoryGirl.attributes_for(:random_avatar) }

  context "signed in as user" do
    login_user

    it "should be able to list avatars" do
      get :index
      response.status.should == 200

    end

    it "show avatar" do
      get :show, {id: avatar.id}
      response.status.should == 200
    end

    it "create avatar" do
      post :create, {avatar: avatar_attrs}
      response.status.should == 302
      a = Avatar.find_by name: avatar_attrs[:name]
      a.should be
    end
  end


end
