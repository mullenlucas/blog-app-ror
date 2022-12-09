require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before(:each) do
    @user = User.create(name: 'Scaloni', 
      photo: 'http://t2.gstatic.com/licensed-image?q=tbn:ANd9GcQFDlJ4A43ilUaxG2lNBrjuUdd0U9JkpW2bFkdQ1KazqW0BkQurzni39eJGw_morP1ehkUo47RdfdXXRJc', 
      bio: 'Football coach and Ruby on Rails developer.')
    4.times do
      Post.create(author: @user, title: 'Crazy Ruby tricks', text: 'This are my tricks')
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
