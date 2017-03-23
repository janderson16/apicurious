require 'rails_helper'

describe StarredRepo do
  attr_reader :current_user

  before(:each) do
    @current_user = User.create(username: "janderson16", email: 'jpa@gmail.com', image: 'pic')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@current_user)
  end

  describe '#all' do
    it "returns all starred_repos" do
      VCR.use_cassette("models/all_starred") do

        starred_repos = StarredRepo.all(@current_user)
        starred_repo  = starred_repos.first

        expect(starred_repos.count).to eq(1)
        expect(starred_repo.class).to eq(StarredRepo)
        expect(starred_repo.name).to eq('lesson_plans')

      end
    end
  end
end
