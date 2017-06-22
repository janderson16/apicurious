require 'rails_helper'

describe GithubService do
  attr_reader :service

  before(:each) do
    current_user = User.create(username: "janderson16", email: 'jpa@gmail.com', image: 'pic')
    @service = GithubService.new(current_user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)
  end

  describe '#repos' do
    it 'returns all repos' do
      VCR.use_cassette("services/all_repos") do
        repos = @service.repos
        repo = repos.first

        expect(repos.count).to eq(21)
        expect(repo[:name]).to eq("advanced_enums")
      end
    end
  end

  describe '#followers' do
    it 'returns all followers' do
      VCR.use_cassette("services/all_followers") do

        followers = @service.followers
        follower = followers.first

        expect(followers.count).to eq(3)
        expect(follower[:login]).to eq("Carmer")
      end
    end
  end

  describe '#following' do
    it 'returns all following' do
      VCR.use_cassette("services/all_following") do

        following = @service.following
        follow_first = following.first

        expect(following.count).to eq(2)
        expect(follow_first[:login]).to eq("s-espinosa")
      end
    end
  end

  describe '#starred' do
    it 'returns all starred repos' do
      VCR.use_cassette("services/all_starred") do

        starred = @service.starred
        starred_first = starred.first

        expect(starred.count).to eq(1)
        expect(starred_first[:name]).to eq("lesson_plans")
      end
    end
  end

  describe '#organizations' do
    it 'returns all organizations' do
      VCR.use_cassette("services/all_orgs") do

        organizations = @service.orgs

        expect(organizations.count).to eq(1)
      end
    end
  end

  describe '#events' do
    it 'returns all events' do
      VCR.use_cassette("services/all_events") do

        events = @service.events
        expect(events.count).to eq(30)
      end
    end
  end

  describe '#received_events' do
    it 'returns all received events' do
      VCR.use_cassette("services/all_received_events") do

        received_events = @service.received_events

        expect(received_events.count).to eq(30)
      end
    end
  end

end
