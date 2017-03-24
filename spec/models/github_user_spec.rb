require 'rails_helper'

describe GithubUser do
  attr_reader :current_user

  before(:each) do
    @current_user = User.create(username: "janderson16", email: 'jpa@gmail.com', image: 'pic')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@current_user)
  end

  describe '#initialize' do
    it "creates a GithubUser" do
      VCR.use_cassette("models/github_user") do

        user = GithubUser.new(@current_user)

        expect(user.class).to eq(GithubUser)

      end
    end
  end
end
