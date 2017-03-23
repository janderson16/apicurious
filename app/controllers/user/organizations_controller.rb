class User::OrganizationsController < ApplicationController
  before_action :authorize!

  def index
    @orgs = Organization.all(current_user)
  end
end
