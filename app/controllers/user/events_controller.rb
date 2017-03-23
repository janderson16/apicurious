class User::EventsController < ApplicationController
  before_action :authorize!

  def index
    @events = Event.all(current_user)
  end

end
