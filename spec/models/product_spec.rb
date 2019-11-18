require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validations' do
    before(:each) do
      category = Category.create(name: "Clothing")
      @product = category.products.new(
        name: "Men's Denim Overalls",
        price: 127.95,
        quantity: 23,
      )
    end

    it 'should be valid when all required fields are present' do
      expect(@product).to be_valid
    end

    it 'should not be valid when name is mising' do
      @product.name = nil

      expect(@product).to_not be_valid
      expect(@product.errors.full_messages_for(:name))
        .to include(match(/blank/i))
    end

    it 'should not be valid when price is missing' do
      @product.price_cents = nil

      expect(@product).to_not be_valid
      expect(@product.errors.full_messages_for(:price))
        .to include(match(/blank/i))
    end

    it 'should not be valid when quantity is missing' do
      @product.quantity = nil

      expect(@product).to_not be_valid
      expect(@product.errors.full_messages_for(:quantity))
        .to include(match(/blank/i))
    end

    it 'should not be valid when category is missing' do
      @product.category = nil

      expect(@product).to_not be_valid
      expect(@product.errors.full_messages_for(:category))
        .to include(match(/blank/i))
    end
  end
end
