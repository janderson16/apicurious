require 'rails_helper'

describe "user can see events of people they follow" do
  scenario "when they visit their recent activity page" do
    VCR.use_cassette("features/") do

      current_user = User.create(username: "janderson16", email: 'jpa@gmail.com', image: 'pic')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)

      visit "/#{current_user.username}/received_events"

      expect(page).to have_content("MemberEvent")
      expect(page).to have_content("s-espinosa")
    end
  end
end
