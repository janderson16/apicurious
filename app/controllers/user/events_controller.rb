class User::EventsController < ApplicationController
  before_action :authorize!

  def index
    @events = Event.all(current_user)
  end

  def show
    @ppl_following = Following.all(current_user)
    urls = @ppl_following.map do |person|
              person.events_url
            end
    binding.pry
    # ppl im following events
  end
end
