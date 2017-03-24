require 'rails_helper'

describe "user can see their repos" do
  scenario "when they visit repos page" do
    VCR.use_cassette("features/repos") do

      current_user = User.create(username: "janderson16", email: 'jpa@gmail.com', image: 'pic')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)

      visit "/#{current_user.username}/repos"

      expect(page).to have_content("My Repos")
      expect(page).to have_content("advanced_enums")
      expect(page).to have_content("Total Repos: 21")
    end
  end
end
