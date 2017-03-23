require 'rails_helper'

describe Event do
  attr_reader :current_user

  before(:each) do
    @current_user = User.create(username: "janderson16", email: 'jpa@gmail.com', image: 'pic')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@current_user)
  end

  describe '#all' do
    it "returns all events" do
      VCR.use_cassette("models/all_events") do

        events = Event.all(@current_user)
        event  = events.first

        expect(events.count).to eq(30)
        expect(event.class).to eq(Event)
        expect(event.type).to eq('IssuesEvent')

      end
    end
  end
end
