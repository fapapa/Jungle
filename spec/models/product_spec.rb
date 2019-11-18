require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validations' do
    it 'should be valid when all required fields are present'

    it 'should not be valid when name is mising'

    it 'should not be valid when price is missing'

    it 'should not be valid when quantity is missing'

    it 'should not be valid when category is missing'
  end
end
