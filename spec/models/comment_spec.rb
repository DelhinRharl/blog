require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'The Comments model' do
    first_user = User.create(name: 'Affaxed', photo: 'link', bio: 'bio', posts_counter: 0,
                             email: 'ad@gmail.com', password: '123456', password_confirmation: '123456')

    first_user.save!

    first_post = Post.new(author: first_user, title: 'Hello', text: 'This is my first post', comments_counter: 0,
                          likes_counter: 0)

    first_post.save!

    commenter = User.new(name: 'Affaxed', photo: 'link', bio: 'bio', posts_counter: 0,
                         email: 'adf@gmail.com', password: '123456')

    first_post.comments.create(text: 'The link is here', author: commenter)

    commenter.save!

    it 'comment must be present' do
      expect(first_post.comments.length).to eq 1
    end

    it 'comment must have a correct text' do
      expect(first_post.comments.first.text).to eq 'The link is here'
    end
  end
end
