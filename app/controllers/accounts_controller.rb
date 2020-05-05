# frozen_string_literal: true

class AccountsController < ApplicationController
  before_action :authenticate_account!
  before_action :set_account, only: %i[show]

  def index
    # user feed
    @posts = Post.active

    following_ids = Follower.where(follower_id: current_account.id).map(&:following_id)
    following_ids << current_account.id
    @follower_suggestions = Account.where.not(id: following_ids)
  end

  def show
    # user profile
    @posts = @account.posts.active
  end

  def follow
    follower = Follower.new(follower_id: current_account.id, following_id: params[:follow_id])
    if follower.save
      flash[:success] = 'Now following user'
    else
      flash[:error] = 'Unable to become follower'
    end
    redirect_to dashboard_path
  end

  private

  def set_account
    @account = Account.find_by_username(params[:username])
  end
end
