require 'rails_helper'

describe ReceivedEvent do
  attr_reader :current_user

  before(:each) do
    @current_user = User.create(username: "janderson16", email: 'jpa@gmail.com', image: 'pic')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@current_user)
  end

  describe '#all' do
    it "returns all received_events" do
      VCR.use_cassette("models/all_received_events") do

        received_events = ReceivedEvent.all(@current_user)
        received_event  = received_events.first

        expect(received_events.count).to eq(30)
        expect(received_event.class).to eq(ReceivedEvent)
        expect(received_event.type).to eq('MemberEvent')

      end
    end
  end
end
