class User::FollowingController < ApplicationController
  before_action :authorize!

  def index
    @ppl_following = Following.all(current_user)
    # binding.pry
  end
end
