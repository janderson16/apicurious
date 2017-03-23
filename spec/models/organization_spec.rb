require 'rails_helper'

describe Organization do
  attr_reader :current_user

  before(:each) do
    @current_user = User.create(username: "janderson16", email: 'jpa@gmail.com', image: 'pic')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@current_user)
  end

  describe '#all' do
    it "returns all organizations" do
      VCR.use_cassette("models/all_orgs") do

        orgs = Organization.all(@current_user)
        org  = orgs.first

        expect(orgs.count).to eq(1)
        expect(org.class).to eq(Organization)
        expect(org.login).to eq('APICuriousTest')

      end
    end
  end
end
