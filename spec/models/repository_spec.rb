require 'rails_helper'

describe Repository do
  attr_reader :current_user

  before(:each) do
    @current_user = User.create(username: "janderson16", email: 'jpa@gmail.com', image: 'pic')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@current_user)
  end

  describe '#all' do
    it "returns all repos" do
      VCR.use_cassette("models/all_repos") do

        repos = Repository.all(@current_user)
        repo  = repos.first

        expect(repos.count).to eq(21)
        expect(repo.class).to eq(Repository)
        expect(repo.name).to eq('advanced_enums')

      end
    end
  end
end
