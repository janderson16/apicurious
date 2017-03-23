require 'rails_helper'

describe Following do
  attr_reader :current_user

  before(:each) do
    @current_user = User.create(username: "janderson16", email: 'jpa@gmail.com', image: 'pic')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@current_user)
  end

  describe '#all' do
    it "returns all people user is following" do
      VCR.use_cassette("models/all_following") do

        following = Following.all(@current_user)
        following_first  = following.first

        expect(following.count).to eq(2)
        expect(following_first.class).to eq(Following)
        expect(following_first.login).to eq('s-espinosa')

      end
    end
  end
end
