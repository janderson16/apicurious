class DashboardController < ApplicationController
  before_action :authorize!

  def show
    @github_user = GithubUser.new(current_user)
  end
end
