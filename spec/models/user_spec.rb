require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation' do
    before(:each) do
      @user = User.new(
        name: 'test user',
        email: 'test@test.com',
        password: 's3kr37',
        password_confirmation: 's3kr37'
      )
    end

    it 'should pass with a valid user' do
      expect(@user).to be_valid
    end

    it 'should fail when password is blank' do
      @user.password = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages_for(:password))
        .to include(match(/blank/i))
    end

    it 'should fail when password confirmation is blank'

    it 'should fail when password confirmation does not match'

    it 'should fail when email already exists (case insensitive)'

    it 'should fail when email is blank'

    it 'should fail when first name is blank'

    it 'should fail when last name is blank'
  end
end
