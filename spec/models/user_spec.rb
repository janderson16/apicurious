require 'rails_helper'


RSpec.describe User, type: :model do
  it 'should be valid with attributes' do
    user = User.create(username: 'janderson16',
                        uid: '1234',
                        token: '1234',
                        email: 'jpa@gmail.com',
                        image: 'image'
                        )


    expect(user).to be_valid
  end
  
  it 'should be INvalid without attributes' do
    user = User.create(username: 'janderson16')



    expect(user).to_not be_valid
  end
end
