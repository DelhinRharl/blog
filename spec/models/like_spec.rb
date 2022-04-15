require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'The Comments model' do
    first_user = User.new(name: 'Affaxed', photo: 'link', bio: 'bio', posts_counter: 0,
                          email: 'bdc@gmail.com', password: '123456', password_confirmation: '123456')

    first_post = Post.new(author: first_user, title: 'Hello', text: 'This is my first post')

    like = Like.new(post: first_post, author: first_user)

    first_user.save!

    first_post.save!

    like.save!

    it 'likes should be present' do
      expect(first_post.likes.length).to eq 0
    end
  end
end
