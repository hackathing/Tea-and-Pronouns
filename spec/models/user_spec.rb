require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is invalid without an email' do
    user = User.new(
      password: "some valid password",
    )
    expect(user).not_to be_valid
    expect(user.errors[:email]).to include "can't be blank"
  end

  it 'is invalid without a password' do
    user = User.new(
      email: "hello@world.com",
    )
    expect(user).not_to be_valid
    expect(user.errors[:password]).to include "can't be blank"
  end

  it 'is invalid when the password is short' do
    user = User.new(
      email: "hello@world.com",
      password: "123",
    )
    expect(user).not_to be_valid
    expect(user.errors[:password]).to include(
      "is too short (minimum is 8 characters)"
    )
  end

  xit 'has a hashed password' do
    
  end
end