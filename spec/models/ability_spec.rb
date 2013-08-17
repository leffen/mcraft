require 'spec_helper'
require 'cancan/matchers'

describe "User" do
  describe "Abilities" do
    subject { ability }
    let(:ability) { Ability.new(user)}
    let(:user) {nil}



  end

end
