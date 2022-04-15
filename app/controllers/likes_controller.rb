class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    like = current_user.likes.new(
      author_id: current_user.id,
      post_id: @post.id
    )
    if like.save
      redirect_to user_post_path(current_user.id, @post.id), notice: 'Post liked!'
    else
      redirect_to user_post_path(current_user.id, @post.id), alert: 'Post not liked!'
    end
  end
end
