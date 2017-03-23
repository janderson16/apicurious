class Organization < OpenStruct

  def self.all(user)
    service = GithubService.new(user)
    service.orgs.map do |org|
      Organization.new(org)
    end
  end
end
