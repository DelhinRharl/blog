class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  def update_posts_count
    author.update(Posts_counter: author.posts.count)  
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

end
