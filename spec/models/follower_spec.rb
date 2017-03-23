require 'rails_helper'

describe Follower do
  attr_reader :current_user

  before(:each) do
    @current_user = User.create(username: "janderson16", email: 'jpa@gmail.com', image: 'pic')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@current_user)
  end

  describe '#all' do
    it "returns all followers" do
      VCR.use_cassette("models/all_followers") do

        followers = Follower.all(@current_user)
        follower  = followers.first

        expect(followers.count).to eq(3)
        expect(follower.class).to eq(Follower)
        expect(follower.login).to eq('Carmer')

      end
    end
  end
end
