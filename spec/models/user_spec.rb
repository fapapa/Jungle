require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation' do
    it 'should pass with a valid user'

    it 'should fail when password is blank'

    it 'should fail when password confirmation is blank'

    it 'should fail when password confirmation does not match'

    it 'should fail when email already exists (case insensitive)'

    it 'should fail when email is blank'

    it 'should fail when first name is blank'

    it 'should fail when last name is blank'
  end
end
