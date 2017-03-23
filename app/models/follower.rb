class Follower < OpenStruct

  def self.all(user)
    service = GithubService.new(user)
    service.followers.map do |person|
      Follower.new(person)
    end
  end
end
