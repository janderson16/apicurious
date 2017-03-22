class GithubService
attr_reader :connection, :auth

  def initialize
    @connection = Faraday.new('https://api.github.com/')
    @auth = "?client_id=#{ENV["client_id"]}&client_secret=#{ENV["client_secret"]}"
  end

  def repos
    parse(connection.get("users/janderson16/repos#{auth}"))
  end

  def followers
    parse(connection.get("users/janderson16/followers#{auth}"))
  end

  def following
    parse(connection.get("users/janderson16/following#{auth}"))
  end

  def starred
    parse(connection.get("users/janderson16/starred#{auth}"))
  end

  def orgs
    parse(connection.get("users/janderson16/orgs#{auth}"))
  end


  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end
