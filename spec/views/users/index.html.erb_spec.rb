require 'rails_helper'

RSpec.describe 'User Index', type: :feature do
  before(:each) do
    @user = User.create(
      name: 'Nuk Tashino',
      bio: 'Software Creator',
      photo: 'https://loremflickr.com/cache/resized/65535_52225415595_375deb9379_z_640_360_nofilter.jpg',
      posts_counter: 1
    )

    @user1 = User.create(
      name: 'Izumi',
      bio: 'Backend Stagnator',
      photo: 'https://loremflickr.com/cache/resized/65535_51819602222_b063349f16_z_640_360_nofilter.jpg',
      posts_counter: 5
    )
  end

  describe 'users index page' do
    it 'displays the created users' do
      visit users_path
      expect(page).to have_content('Nuk Tashino')
      expect(page).to have_content('Izumi')
    end

    it 'shows the right photo' do
      visit users_path
      expect(page).to have_css("img[src*='https://loremflickr.com/cache/resized/65535_52225415595_375deb9379_z_640_360_nofilter.jpg']")
      expect(page).to have_css("img[src*='https://loremflickr.com/cache/resized/65535_51819602222_b063349f16_z_640_360_nofilter.jpg']")
    end

    it 'displays the right Number of posts' do
      visit users_path
      expect(page).to have_content('Number of posts: 1')
      expect(page).to have_content('Number of posts: 5')
    end

    it 'displays a info of a selected user when is redirected to show path' do
      visit users_path
      click_link 'Nuk Tashino'
      expect(page).to have_content('Software Creator')
      expect(page).to_not have_content('Backend Stagnator')
    end
  end
end