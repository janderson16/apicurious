class User::FollowersController < ApplicationController
  before_action :authorize!

  def index
    @followers = Follower.all(current_user)
  end
end
