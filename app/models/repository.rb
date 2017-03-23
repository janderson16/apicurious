class Repository < OpenStruct

  def self.all(user)
    service = GithubService.new(user)
    service.repos.map do |repo|
      Repository.new(repo)
    end
  end
end
