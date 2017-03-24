require 'rails_helper'

describe "user can see their starred repos" do
  scenario "when they visit starred page" do
    VCR.use_cassette("features/starred") do

      current_user = User.create(username: "janderson16", email: 'jpa@gmail.com', image: 'pic')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)

      visit "/#{current_user.username}/starred"

      expect(page).to have_content("My Starred Repos")
      expect(page).to have_content("lesson_plans")
      expect(page).to have_content("turingschool")
    end
  end
end
