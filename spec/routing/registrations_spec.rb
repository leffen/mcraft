require_relative '../spec_helper'

describe RegistrationsController do

  it "should redirect to root after successful signup" do
    get('/users/sign_up').should route_to('registrations#new')
  end

end