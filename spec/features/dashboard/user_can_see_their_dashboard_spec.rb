require 'rails_helper'

describe "user can see their dashboard" do
  scenario "when they login" do
    VCR.use_cassette("features/dash") do

      current_user = User.create(username: "janderson16", email: 'james.p.anderson16@gmail.com', image: 'pic')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)

      visit "/dashboard"

      expect(page).to have_content("Username: janderson16")
      expect(page).to have_content("Email: james.p.anderson16@gmail.com")

    end
  end
end
