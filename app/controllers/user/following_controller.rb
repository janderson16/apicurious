class User::FollowingController < ApplicationController
  before_action :authorize!

  def index
    # response = Faraday.get("https://api.github.com/users/janderson16/following")
    # # binding.pry
    # @following = JSON.parse(response.body)
  end
end
