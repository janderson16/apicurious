class GithubService
attr_reader :connection, :auth, :current_user

  def initialize(current_user)
    # binding.pry
    @connection = Faraday.new('https://api.github.com/')
    @auth = "?client_id=#{ENV["client_id"]}&client_secret=#{ENV["client_secret"]}"
    @current_user = current_user
  end

  def repos
    parse(connection.get("users/#{current_user.username}/repos#{auth}"))
  end

  def followers
    parse(connection.get("users/#{current_user.username}/followers#{auth}"))
  end

  def following
    parse(connection.get("users/#{current_user.username}/following#{auth}"))
  end

  def starred
    parse(connection.get("users/#{current_user.username}/starred#{auth}"))
  end

  def orgs
    parse(connection.get("users/#{current_user.username}/orgs#{auth}"))
  end


  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end
