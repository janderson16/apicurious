require 'rails_helper'


RSpec.describe User, type: :model do
  it 'should be valid with attributes' do
    user = User.create(uid: '1234',
                       username: 'janderson16',
                       email: 'jpa@gmail.com',
                       image: 'image'
                       )
    data = {login: 'janderson16',
            id: '1234',
            email: 'jpa@gmail.com',
            provider: 'github',
            avatar_url: 'image',
            followers: 'some',
            following: 'less',
            repos_url: 'github_ether',
            public_repos: 'all',
            starred_url: 'some_place'
            }
    access_token = "super_secret"

    User.from_github(data, access_token)

    expect(user).to be_valid
    expect(user.username).to eq(user['username'])
    expect(user.username).to eq('janderson16')
  end

  it 'should be INvalid without attributes' do
    user = User.create(username: 'janderson16')



    expect(user).to_not be_valid
  end
end
