require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.create(
      name: 'Taylor',
      photo: 'https://img.olympicchannel.com/images/image/private/f_auto/t_1-1_300/primary/wfrhxc0kh2vvq77sonki',
      bio: 'Football player',
      posts_counter: 9
    )
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:bio) }
    it { should validate_numericality_of(:posts_counter) }
    it 'photo value is a string' do
      subject.photo = 'https://img.olympicchannel.com/images/image/private/f_auto/t_1-1_300/primary/wfrhxc0kh2vvq77sonki'
      expect(subject).to be_valid
    end
    it 'posts_counter valur to be an integer' do
      subject.posts_counter = 9
      expect(subject).to be_valid
    end
  end

  describe 'associations' do
    it { should have_many(:posts) }
    it { should have_many(:likes) }
    it { should have_many(:comments) }
  end
end
