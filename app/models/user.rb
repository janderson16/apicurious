class User < ActiveRecord::Base
  @client_id = ENV["client_id"]

  def self.from_github(data, access_token)
    user          = User.find_or_create_by(uid: data['id'], provider: 'github')
    user.username = data['login']
    user.token    = access_token
    user.email    = data['email']
    user.image    = data['avatar_url']
    user.followers = data['followers']
    user.following = data['following']
    user.repos = data['repos_url']
    user.public_repos = data['public_repos']
    user.starred  = data['starred_url']
    # binding.pry
    user.save

    return user
  end
end
