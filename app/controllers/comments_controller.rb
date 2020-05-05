class CommentsController < ApplicationController
  before_action :authenticate_account!, only: %i[new create]

  def create
    @comment = current_account.comments.new(comment_params)

    if @comment.save
      flash[:success] = 'Comment was created successfully!'
    else
      flash[:error] = 'Comment was not saved!'
    end
    redirect_to dashboard_path
  end

  private

  def comment_params
    params.require(:comment).permit(:account_id, :post_id, :comment)
  end
end
