class ReceivedEvent < OpenStruct

  def self.all(user)
    service = GithubService.new(user)
    service.received_events.map do |event|
      ReceivedEvent.new(event)
    end
  end
end
