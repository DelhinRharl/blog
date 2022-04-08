require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'The Comments model' do
    first_user = User.create(name: 'Affax', photo: 'photo.png', bio: 'Teacher from Mars.')

    first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')

    like = Like.new(post: first_post, author: first_user)

    like.save!

    it 'likes should be present' do
      expect(first_post.likes.length).to eq 1
    end
  end
end
