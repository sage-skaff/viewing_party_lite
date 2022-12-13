require 'rails_helper'

describe 'Log In Page' do
  it 'has a form to input email and password' do
    user = User.create(name: 'Rey',
                       email: 'rey@test.com',
                       password: 'password123',
                       password_confirmation: 'password123')
    visit login_path

    fill_in :email, with: 'rey@test.com'
    fill_in :password, with: 'password123'

    click_on 'Log In'

    expect(current_path).to eq(user_path)
    expect(page).to have_content("#{user.name}'s Dashboard")
  end
end
