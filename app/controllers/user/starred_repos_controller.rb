class User::StarredReposController < ApplicationController
  before_action :authorize!

  def index
    @starred = StarredRepo.all(current_user)
  end
end
