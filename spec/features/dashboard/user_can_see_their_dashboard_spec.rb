require 'rails_helper'

describe "user can see their dashboard" do
  scenario "when they login" do
    VCR.use_cassette("features/dash") do

      current_user = User.create(username: "janderson16", name: "James Anderson", email: 'james.p.anderson16@gmail.com', image: 'pic')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)

      visit "/#{current_user.username}/dashboard"


      expect(page).to have_content("janderson16")
      expect(page).to have_content("james.p.anderson16@gmail.com")
      expect(page).to have_content("James Anderson")

    end
  end
  scenario "but not when they aren't logged" do
    VCR.use_cassette("features/dash") do


      visit "/janderson16/dashboard"


      expect(page).to_not have_content("janderson16")
      expect(page).to_not have_content("james.p.anderson16@gmail.com")
      expect(page).to_not have_content("James Anderson")

    end
  end
end
