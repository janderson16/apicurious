class Following < OpenStruct

  def self.all(user)
    service = GithubService.new(user)
    service.following.map do |person|
      Following.new(person)
    end
  end
end
