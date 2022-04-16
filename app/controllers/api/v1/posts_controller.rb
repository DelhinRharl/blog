module Api
  module V1
    class PostsController < ApplicationController
      def index
        if request.headers['X-AUTH-TOKEN']
          @user = User.find_by_api_token(request.headers['X-AUTH-TOKEN'])
          @posts = Post.where(author_id: @user)
          render json: { success: true, message: 'Loaded all posts', data: { posts: @posts } }, status: :ok
        else
          respond_to do |format|
            format.json { render json: 'Kindly sign in or enter the authentication token', status: :ok }
          end
        end
      end
      def create
        if request.headers['X-AUTH-TOKEN']
          @user = User.find_by_api_token(request.headers['X-AUTH-TOKEN'])
          @new_post = @user.posts.new(title: params[:title], text: params[:text])
          if @new_post.save
            render json: { success: true, message: 'Post created', data: { post: @new_post } }, status: :created
          else
            render json: { success: false, errors: @new_post.errors }, status: :unprocessable_entity
          end
        else
          respond_to do |format|
            format.json { render json: 'Kindly sign in or enter the authentication token', status: :ok }
          end
        end
      end
    end
  end
end