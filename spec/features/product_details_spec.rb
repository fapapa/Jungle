require 'rails_helper'

RSpec.feature 'ProductDetails', type: :feature, js: true do
  before :each do
    @category = Category.create!(name: 'Apparel')

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
      @a_product = Product.first
    end
  end

  scenario 'Navigate to product details page' do
    visit root_path
    click_on @a_product.name
    expect(page).to have_css('article.product-detail')
  end
end
