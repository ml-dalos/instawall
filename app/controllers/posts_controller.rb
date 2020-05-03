class PostsController < ApplicationController
  before_action :authenticate_account!, only: %i[new create]

  def new
    @post = Post.new
  end

  def create
    @post = current_account.posts.new(post_params)

    if @post.save
      redirect_to dashboard_path, flash: { success: 'Post was created successfully!' }
    else
      redirect_to new_post_path, flash: { error: 'Post was not saved!' }
    end
  end

  def show; end

  private

  def post_params
    params.require(:post).permit(:image, :image_cache, :description)
  end
end
