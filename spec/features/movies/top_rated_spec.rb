require 'rails_helper'

RSpec.describe 'Top Rated Movies' do
  before(:each) do
    @user1 = User.create!(name: 'Chad', email: 'chad1@gmail.com', password: 'chad123')
    @user2 = User.create!(name: 'Jessica', email: 'jessica2@gmail.com', password: 'jess123')
    @user3 = User.create!(name: 'Fiona', email: 'Fiona3@gmail.com', password: 'fiona123')
  end

  describe 'happy path' do
    it 'gives the user up to 20 top rated movies' do
      visit user_discover_path(@user1.id)
      click_button 'Find Top Rated Movies'

      expect(page.status_code).to eq(200)
      expect(current_path).to eq(user_movies_path(@user1.id))
      expect(page).to have_content('The Godfather')
    end
  end
end
