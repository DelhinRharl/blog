require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User model' do
    first_user = User.new(name: 'Affax', photo: 'url', bio: 'Teacher from Mars.')

    before { first_user.save }

    it 'checks that name is not blank' do
      first_user.name = nil
      expect(first_user).to_not be_valid
    end

    it 'checks if post counter is a numeral' do
      first_user.posts_counter = 'one'
      expect(first_user).to_not be_valid
    end

    it 'should have 0 posts' do
      expect(first_user.recent_posts.length).to eq 0
    end
  end
end
