class FollowersController < ApplicationController
  before_action :authorize!

  def index
    response = Faraday.get("https://api.github.com/users/janderson16/followers")
    # binding.pry
    @followers = JSON.parse(response.body)
  end
end
