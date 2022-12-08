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
      expect(response.body).to include('Here is the list of users:')
    end
  end

  describe 'GET /show' do
    before(:each) do 
      @user = User.create(name: 'Scaloni', 
        photo: 'https://www.cronista.com/files/image/486/486079/63626859b6090_360_480!.jpg?s=93b47f953e7bfcf7bd1ca5126d324c0a&d=1667405345', 
        bio: 'Football player, coach and Ruby on Rails developer')
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
