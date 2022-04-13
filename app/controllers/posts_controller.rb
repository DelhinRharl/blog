class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments, :likes)
  end

  def show
    @post = Post.includes(:comments, :likes).find(params[:id])
    @user = @post.author
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @new_post = current_user.posts.new(post_params)
    respond_to do |f|
      f.html do
        if @new_post.save
          redirect_to "/users/#{@new_post.author.id}/posts/", notice: 'Post successfully created!'
        else
          render :new, alert: 'Post not created!'
        end
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    user = User.find(params[:user_id])
    user.posts_counter -= 1
    @post.destroy!
    user.save
    flash[:success] = 'Post deleted!'
    redirect_to user_posts_path(user.id)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
