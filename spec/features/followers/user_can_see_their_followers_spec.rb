require 'rails_helper'

describe "user can see their followers" do
  scenario "when they visit followers page" do
    VCR.use_cassette("features/followers") do

      current_user = User.create(username: "janderson16", email: 'jpa@gmail.com', image: 'pic')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)

      visit "/#{current_user.username}/followers"

      expect(page).to have_content("Carmer")
      expect(page).to have_content("meyerhoferc")
      expect(page).to have_content("alfosco")
    end
  end
end
