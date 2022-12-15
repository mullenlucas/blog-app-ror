require 'rails_helper'

RSpec.describe 'Show Index', type: :feature do
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

    @post1 = Post.create(
      author_id: @user.id,
      title: 'First post',
      text: 'Nukking my first post',
      comments_counter: 0,
      likes_counter: 0
    )

    @post2 = Post.create(
      author_id: @user.id,
      title: 'Second post',
      text: 'Nukking my second post',
      comments_counter: 1,
      likes_counter: 1
    )

    @post3 = Post.create(
      author_id: @user.id,
      title: 'Third post',
      text: 'Nukking my third post',
      comments_counter: 1,
      likes_counter: 1
    )

    @post4 = Post.create(
      author_id: @user.id,
      title: 'Fourth post',
      text: 'Nukking my Fourth post',
      comments_counter: 1,
      likes_counter: 1
    )
  end

  describe 'Show path displays specific user info' do
    it 'displays the right username' do
      visit user_path(@user)
      expect(page).to have_content('Nuk Tashino')
      expect(page).to_not have_content('Izumi')
    end

    it 'displays the users profile photo' do
      visit user_path(@user)
      expect(page).to have_css("img[src*='https://loremflickr.com/cache/resized/65535_52225415595_375deb9379_z_640_360_nofilter.jpg']")
    end

    it 'displays the right biography' do
      visit user_path(@user)
      expect(page).to have_content('Software Creator')
      expect(page).to_not have_content('Backend Stagnator')
    end

    it 'displays the right biography in case we click second user' do
      visit user_path(@user1)
      expect(page).to have_content('Backend Stagnator')
      expect(page).to_not have_content('Software Creator')
    end

    it 'displays the number of posts the user has written' do
      visit user_path(@user)
      expect(page).to have_content('Number of posts: 5')
      expect(page).to_not have_content('Number of posts: 4')
    end

    it 'displays the posts' do
      visit user_path(@user)
      expect(page).to have_content('Fourth post')
      expect(page).to have_content('third post')
      expect(page).to have_content('second post')
      expect(page).to have_content('first post')
    end

    it 'checks there is a See all posts button' do
      visit user_path(@user)
      expect(page).to have_content('See all posts')
    end

    it 'Redirects to the users posts index page if we click See all posts button' do
      visit user_path(@user)
      click_link 'See all posts'
      expect(page).to have_current_path(user_posts_path(@user))
    end

    it 'click a users post, it redirects to the posts show page' do
      visit user_path(@user)
      click_link 'Fourth post'
      expect(page).to have_current_path(user_post_path(@user, @post4))
    end
  end
end
