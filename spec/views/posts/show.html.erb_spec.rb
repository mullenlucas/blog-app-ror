require 'rails_helper'

RSpec.describe 'Post Show', type: :feature do
  before(:each) do
    @user = User.create(
      name: 'Nuk Tashino',
      bio: 'Software Creator',
      photo: 'https://loremflickr.com/cache/resized/65535_52225415595_375deb9379_z_640_360_nofilter.jpg',
      posts_counter: 0
  )

    @user1 = User.create(
      name: 'Izumi',
      bio: 'Backend Stagnator',
      photo: 'https://loremflickr.com/cache/resized/65535_52225415595_375deb9379_z_640_360_nofilter.jpg',
      posts_counter: 5
    )

    @post = Post.create(
      author_id: @user.id,
      title: 'First post',
      text: "This is Nuk's first post",
      comments_counter: 0,
      likes_counter: 0
    )

    Comment.create(post_id: @post.id, author_id: @user.id, text: 'Is this real life')
    Comment.create(post_id: @post.id, author_id: @user.id, text: 'Or is this just fantasy')
    Comment.create(post_id: @post.id, author_id: @user1.id, text: 'Something something')
    Like.create(post_id: @post.id, author_id: @user1.id)

  end

  describe 'Displays the entire body comments counters, and title' do

    it 'displays the counters' do
      visit user_post_path(@user, @post)
      expect(page).to have_content('Comments: 3')
      expect(page).to have_content('Likes: 1')
    end

    it 'displays post title' do
      visit user_post_path(@user, @post)
      expect(page).to have_content('Is this real life')
    end

    it 'displays post\s author as the title' do
      visit user_post_path(@user, @post)
      expect(page).to have_content('First post by Nuk Tashino')
    end

    it 'displays the post\s text/content' do
      visit user_post_path(@user, @post)
      expect(page).to have_content("This is Nuk's first post")
    end

    it 'checks there is a comment section' do
        visit user_post_path(@user, @post)
        # expect(page).to have_css("ul[class*='comments-section']")
        expect(page).to have_content('Comments')
    end

    it 'displays all comments with usernames' do
      visit user_post_path(@user, @post)
      expect(page).to have_content('Nuk Tashino: Is this real life')
      expect(page).to have_content('Nuk Tashino: Or is this just fantasy')
      expect(page).to have_content('Izumi: Something something')
    end
  end
end