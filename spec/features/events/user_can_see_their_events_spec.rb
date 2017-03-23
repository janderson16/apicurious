require 'rails_helper'

describe "user can see their events" do
  scenario "when they visit events page" do
    VCR.use_cassette("features/events") do

      current_user = User.create(username: "janderson16", email: 'jpa@gmail.com', image: 'pic')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)

      visit "/#{current_user.username}/events"

      expect(page).to have_content("IssuesEvent")
    end
  end
end
