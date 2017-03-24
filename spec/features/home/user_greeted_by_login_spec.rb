require 'rails_helper'

describe "user is met by login" do
  scenario "when they visit site" do
    VCR.use_cassette("features/login") do

      visit "/"

      expect(page).to have_content("Welcome to APIcurious")
      expect(page).to have_content("Please Sign In")
      expect(page).to have_content("Login with Github")

    end
  end

  scenario "when they try to access site unauthenticated" do
    VCR.use_cassette("features/deadend") do

      visit "/dashboard"


      expect(current_path).to eq('/')
      expect(page).to have_content("Please Sign In")
    end
  end
end
