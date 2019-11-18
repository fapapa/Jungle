require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation' do
    it 'should pass with a valid user' do
      @user = User.new(
        name: 'test user',
        email: 'test@test.com',
        password: 's3kr37',
        password_confirmation: 's3kr37'
      )

      expect(@user).to be_valid
    end

    it 'should fail when password is blank' do
      @user = User.new(
        name: 'test user',
        email: 'test@test.com',
        password: nil,
        password_confirmation: 's3kr37'
      )

      @user.password = nil
      expect(@user).to_not be_valid
    end

    it 'should fail when password confirmation is blank'

    it 'should fail when password confirmation does not match'

    it 'should fail when email already exists (case insensitive)'

    it 'should fail when email is blank'

    it 'should fail when first name is blank'

    it 'should fail when last name is blank'
  end
end
