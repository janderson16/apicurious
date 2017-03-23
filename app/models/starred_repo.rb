class StarredRepo < OpenStruct

  def self.all(user)
    service = GithubService.new(user)
    service.starred.map do |star|
      StarredRepo.new(star)
    end
  end
end
