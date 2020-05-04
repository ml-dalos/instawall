class LikesController < ApplicationController
  before_action :authenticate_account!

  def like
    respond_to do |format|
      format.json do
        @success, @action = if Like.exists?(account_id: current_account.id, post_id: params[:post_id])
                              [Like.destroy_by(account_id: current_account.id, post_id: params[:post_id]), 'delete']
                            else
                              [Like.create(account_id: current_account.id, post_id: params[:post_id]), 'create']
                            end
        @likes_count = Post.find(params[:post_id]).likes_count
        render 'like.json.erb'
      end
    end
  end
end
