require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:each) do
      get users_path
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders correct template' do
      expect(response).to render_template(:index)
    end

    it 'includes placeholder text' do
      expect(response.body).to include('Users')
    end
  end

  describe 'GET /show' do
    before(:each) do
      @user = User.create(name: 'Messi',
                          photo: 'https://img.olympicchannel.com/images/image/private/f_auto/t_1-1_300/primary/wfrhxc0kh2vvq77sonki',
                          bio: 'Football GOAT and Ruby on Rails educator')
      get user_path(@user.id)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders correct template' do
      expect(response).to render_template(:show)
    end

    it 'includes placeholder text' do
      expect(response.body).to include(@user.bio)
    end
  end
end
