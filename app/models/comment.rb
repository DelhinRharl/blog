class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def comments_count
    post.increment!(:Commets_counter)
  end
end
