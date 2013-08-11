require 'spec_helper'

describe RegistrationsController do
  include Devise::TestHelpers
#    fixtures :all
  render_views

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe "POST 'create'" do

    describe "success" do
      before(:each) do
        @attr = {:email => "user@example.com",
                 :password => "foobar01", :password_confirmation => "foobar01",  :username=>'newuser', :first_name => 'New user fornavn'}
      end

      it "should create a user" do
        lambda do
          post :create, :user => @attr
          response.should redirect_to(root_path)
        end.should change(User, :count).by(1)
      end

    end

  end

  describe "PUT 'update'" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      @user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the confirmable module
      sign_in @user
    end

    describe "Success" do

      it "should change the user's display name" do
        puts "Before put"
        @attr = {:email => @user.email, :first_name => "Test1", :current_password => @user.password}
        put :update, :id => @user, :user => @attr
        puts @user.errors.messages
        @user.first_name.should == @attr[:first_name]
      end

    end
  end


end
