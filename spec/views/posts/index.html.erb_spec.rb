require 'rails_helper'

RSpec.describe 'Post Index', type: :feature do
  before(:each) do
    @user = User.create(
      name: 'Nuk Tashino',
      bio: 'Software Creator',
      photo: 'https://loremflickr.com/cache/resized/65535_52225415595_375deb9379_z_640_360_nofilter.jpg',
      posts_counter: 0
    )

    @post1 = Post.create(
      author_id: @user.id,
      title: 'First post',
      text: "This is Nuk's first post",
      comments_counter: 0,
      likes_counter: 0
    )

    @post2 = Post.create(
      author_id: @user.id,
      title: 'Second post',
      text: "This is Nuk's second post",
      comments_counter: 0,
      likes_counter: 0
    )

    # First post comments
    Comment.create(post_id: @post1.id, author_id: @user.id, text: 'Dropping a nukky comment')
    Comment.create(post_id: @post1.id, author_id: @user.id, text: 'Damn this comment rules')
    Comment.create(post_id: @post1.id, author_id: @user.id, text: 'Nana what a mighty post')
    Comment.create(post_id: @post1.id, author_id: @user.id, text: 'This dude is awesome!')
    Comment.create(post_id: @post1.id, author_id: @user.id, text: 'Duke Nukkem in the house')
    Comment.create(post_id: @post1.id, author_id: @user.id, text: 'Say what my bro')

    # Second post single comment
    Comment.create(post_id: @post2.id, author_id: @user.id, text: 'Dropping some comment here in post 2')

    # Likes for first post
    Like.create(post_id: @post1.id, author_id: @user.id)
    Like.create(post_id: @post1.id, author_id: @user.id)

    # Likes for second post
    Like.create(post_id: @post2.id, author_id: @user.id)
  end

  describe 'a post index page' do
    it 'displays the user name' do
      visit user_posts_path(@user)
      expect(page).to have_content('Nuk Tashino')
    end

    it 'displays the user photo' do
      visit user_posts_path(@user)
      expect(page).to have_css("img[src*='https://loremflickr.com/cache/resized/65535_52225415595_375deb9379_z_640_360_nofilter.jpg']")
    end

    it 'displays the number of posts' do
      visit user_posts_path(@user)
      expect(page).to have_content('Number of posts: 2')
    end

    it 'checks for some body content INCLUDING Post\s titles' do
      visit user_posts_path(@user)

      # Post titles
      expect(page).to have_content('First post')
      expect(page).to have_content('Second post')
      expect(page).to have_content("This is Nuk's first post")
      expect(page).to have_content("This is Nuk's second post")
    end

    it 'displays number of likes and comments' do
      visit user_posts_path(@user)

      # First user post
      expect(page).to have_content('Likes: 2')
      expect(page).to have_content('Comments: 6')

      # Second user post
      expect(page).to have_content('Likes: 1')
    end

    it 'displays the last 5 comments per post' do
      visit user_posts_path(@user)
      expect(page).to have_content('Say what my bro')
      expect(page).to have_content('Duke Nukkem in the house')
      expect(page).to have_content('This dude is awesome!')
      expect(page).to have_content('Nana what a mighty post')
      expect(page).to have_content('Damn this comment rules')
      expect(page).to_not have_content('Dropping a nukky comment')
    end

    it 'displays second\s post comment' do
      visit user_posts_path(@user)
      expect(page).to have_content('Dropping some comment here in post 2')
    end

    it 'redirects you to the specific post show view when is clicked' do
      visit user_posts_path(@user)
      click_link 'First post'
      expect(page).to have_current_path(user_post_path(@user, @post1))
    end

    it 'it me to a posts show page when the post is clicked' do
      visit user_posts_path(@user)
      click_link 'Second post'
      expect(page).to have_current_path(user_post_path(@user, @post2))
    end

    it 'checks that there is an Add a new post link' do
      visit user_posts_path(@user)
      expect(page).to have_link('New Post')
    end
  end
end
