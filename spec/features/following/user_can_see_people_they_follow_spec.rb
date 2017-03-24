require 'rails_helper'

describe "user can see people they follow" do
  scenario "when they visit following page" do
    VCR.use_cassette("features/following") do

      current_user = User.create(username: "janderson16", email: 'jpa@gmail.com', image: 'pic')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)

      visit "/#{current_user.username}/following"

      expect(page).to have_content("s-espinosa")
      expect(page).to have_content("alfosco")
      expect(page).to have_content("Folks I'm Following")
    end
  end
end
