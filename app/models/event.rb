class Event < OpenStruct

  def self.all(user)
    service = GithubService.new(user)
    service.events.map do |event|
      Event.new(event)
    end
  end
end
