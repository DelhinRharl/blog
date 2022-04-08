require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Post model' do
    first_user = User.create(name: 'Affax', bio: 'Music lover.')
    subject { Post.new(title: 'Music', text: 'Singing and Dancing', author_id: first_user) }
    before { subject.save }

    it 'Checks if title is filled' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'Checks character count' do
      subject.title = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ultrices dui eu tempor suscipit. Ut sagittis risus nisi, fermentum ultricies arcu interdum et. Aenean interdum pretium magna. Etiam efficitur aliquam vestibulum. Duis convallis odio nisi. Cras sagittis sagittis turpis, non tincidunt augue sagittis at. Vivamus nec dui et lectus venenatis porttitor. Sed ut sagittis leo, egestas porttitor.'
      expect(subject).to_not be_valid
    end

    it 'loads 5  recent comments ' do
      expect(subject.recent_comments).to eq(subject.comments.last(5))
    end

    it 'checks likes value' do
      expect(subject.likes_counter).to be >= 0
    end

    it 'checks comments value' do
      expect(subject.comments_counter).to be >= 0
    end

    it 'checks counter numericality' do
      subject.comments_counter = 'one'
      expect(subject).to_not be_valid
    end

    it 'checks likes numericality' do
      subject.likes_counter = 'one'
      expect(subject).to_not be_valid
    end
  end
end
