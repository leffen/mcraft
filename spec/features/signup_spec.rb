require_relative '../spec_helper'


describe "the sign up process", :type => :feature, :js => false do
  let(:user) {FactoryGirl.create(:user)}

  it "signs a user up" do
    visit new_user_registration_path
    puts current_path
    within("#register") do
      fill_in 'Fornavn', :with => user.first_name
      fill_in 'Brukernavn', :with => user.username
      fill_in 'Epost', :with => user.email
      fill_in 'passord', :with => 'password'
      fill_in 'Gjenta passord', :with => 'password'
    end
    click_button 'Opprett meg som bruker'
    page.status_code.should be(200)
   # todo find out why capybara redirects to wrong page.
   puts current_path
   # User.find_by( username: user.username).should exist
   # expect(page).to have_content 'confirmation link has been sent'
  end
end

