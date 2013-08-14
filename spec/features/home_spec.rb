require_relative '../spec_helper'


describe "the home page", :type => :feature, :js => false do
  let(:user) {FactoryGirl.create(:user)}

  it "should be able show the homepage without errors" do
    visit root_path
    current_path.should == root_path
    page.status_code.should be(200)
    expect(page).to have_no_content 'error'
  end
end

