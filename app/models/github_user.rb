class GithubUser < OpenStruct
  attr_reader :service

  def initialize(current_user)
    @service ||=GithubService.new(current_user)
  end
end
