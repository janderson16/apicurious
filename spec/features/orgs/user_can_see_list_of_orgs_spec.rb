require 'rails_helper'

describe "user can see their organizations" do
  scenario "when they visit organizations page" do
    VCR.use_cassette("features/orgs") do

      current_user = User.create(username: "janderson16", email: 'jpa@gmail.com', image: 'pic')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)

      visit "/#{current_user.username}/organizations"

      expect(page).to have_content("Organizations I'm a part of: 1")
      expect(page).to have_content("APICuriousTest")
    end
  end
end
