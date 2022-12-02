require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) do
    User.new(
      name: 'Lio Messi',
      photo: 'https://img.olympicchannel.com/images/image/private/f_auto/t_1-1_300/primary/wfrhxc0kh2vvq77sonki',
      bio: 'Football player',
      posts_counter: 9
    )
  end

  let(:post) do
    Post.new(
      author: user,
      title: 'My first goal',
      text: 'My first goal was kinda cool but not as cool as my second goal',
      comments_counter: 3,
      likes_counter: 94
    )
  end

  let(:like) do
    Like.new(
      author: user,
      post:
    )
  end

  it 'is the like valid for a user' do
    like.author = user
    expect(like).to be_valid
  end

  it 'is the like valid for a post' do
    like.post = post
    expect(like).to be_valid
  end

  describe 'associations' do
    it { should belong_to(:post) }
    it { should belong_to(:author) }
  end
end
