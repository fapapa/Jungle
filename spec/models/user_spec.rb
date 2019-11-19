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

    it 'should fail when password confirmation does not match' do
      @user.password_confirmation = 'NotAMatch'
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages_for(:password_confirmation))
        .to include(match(/match/i))
    end

    it 'should fail when email already exists (case insensitive)' do
      existing_user = User.create(
        @user.attributes.merge(
          email: 'TEST@TEST.COM',
          password: 's3kr37',
          password_confirmation: 's3kr37'
        )
      )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages_for(:email))
        .to include(match(/taken/i))
    end

    it 'should fail when email is blank' do
      @user.email = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages_for(:email))
        .to include(match(/blank/i))
    end

    it 'should fail when name is blank' do
      @user.name = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages_for(:name))
        .to include(match(/blank/i))
    end

    it 'should fail when password is too short' do
      @user.password = 'short'
      @user.password_confirmation = 'short'
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages_for(:password))
        .to include(match(/short/i))
    end
  end

  describe '.authenticate_with_credentials' do
    context 'with valid credentials' do
      it 'returns the user with those credentials' do
        existing_user = User.create(
          name: 'real user',
          email: 'test@test.com',
          password: 's3kr37',
          password_confirmation: 's3kr37'
        )

        expect(User.authenticate_with_credentials('test@test.com', 's3kr37'))
          .to eq(existing_user)
      end
    end

    context 'with invalid credentials' do
      it 'returns false with a non-existent email' do
        existing_user = User.create(
          name: 'real user',
          email: 'test@test.com',
          password: 's3kr37',
          password_confirmation: 's3kr37'
        )

        expect(User.authenticate_with_credentials('not_in@database.com', 's3kr37'))
          .to be false
      end

      it 'returns false with a wrong password'
    end
  end
end
