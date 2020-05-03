class AccountsController < ApplicationController
  before_action :authenticate_account!
  before_action :set_account, only: %i[show]

  def index
    # user feed
    @posts = Post.active
  end

  def show
    # user profile
    @posts = @account.posts.active
  end

  private

  def set_account
    @account = Account.find_by_username(params[:username])
  end
end
