require 'rails_helper'

RSpec.feature "UserLogin", type: :feature, js: true do
  before :each do
    @user = User.create!(
      name: 'test user',
      email: 'test@user.com',
      password: 's3kr37',
      password_confirmation: 's3kr37'
    )
  end

  scenario 'A user logs in with correct credentials and gets redirect to home' do
    visit root_path

    click_on 'Login'
    fill_in 'Email', with: 'test@user.com'
    fill_in 'Password', with: 's3kr37'
    click_on 'Log In'

    expect(page).to have_current_path(root_path)
  end
end
