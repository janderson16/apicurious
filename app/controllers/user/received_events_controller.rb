class User::ReceivedEventsController < ApplicationController
  def index
    @received_events = ReceivedEvent.all(current_user)
  end
end
