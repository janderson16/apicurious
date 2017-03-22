require 'rails_helper'

describe GithubService do
  attr_reader :service

  before(:each) do
    @service = GithubService.new
  end

  describe '#repos' do
    it 'returns all repos' do
      repos = @service.repos
      repo = repos.first

      expect(repos.count).to eq(21)
      expect(repo[:name]).to eq("advanced_enums")
    end
  end

  describe '#followers' do
    it 'returns all followers' do
      followers = @service.followers
      follower = followers.first

      expect(followers.count).to eq(2)
      expect(follower[:login]).to eq("Carmer")
    end
  end

  describe '#following' do
    it 'returns all following' do
      following = @service.following
      follow_first = following.first

      expect(following.count).to eq(2)
      expect(follow_first[:login]).to eq("s-espinosa")
    end
  end

  describe '#starred' do
    it 'returns all starred repos' do
      starred = @service.starred
      starred_first = starred.first

      expect(starred.count).to eq(1)
      expect(starred_first[:name]).to eq("lesson_plans")
    end
  end

  describe '#organizations' do
    it 'returns all organizations' do
      organizations = @service.orgs

      expect(organizations.count).to eq(0)
    end
  end

end
