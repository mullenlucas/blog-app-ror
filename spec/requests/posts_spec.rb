require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before(:each) do
    @user = User.create(name: 'Messi',
                        photo: 'https://img.olympicchannel.com/images/image/private/f_auto/t_1-1_300/primary/wfrhxc0kh2vvq77sonki',
                        bio: 'Football player and Ruby master coder')
    3.times do
      Post.create(author: @user, title: 'Title', text: 'How to code while being the GOAT')
    end
  end

  describe 'GET #index' do
    before(:example) { get user_posts_path(@user.id) }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders correct template' do
      expect(response).to render_template(:index)
    end

    it 'includes placeholder text' do
      expect(response.body).to include(@user.name)
    end
  end

  describe 'GET #show' do
    before(:example) do
      @post = @user.posts[0]
      get user_post_path(@user.id, @post.id)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders correct template' do
      expect(response).to render_template(:show)
    end

    it 'includes placeholder text' do
      expect(response.body).to include(@post.title)
    end
  end
end
