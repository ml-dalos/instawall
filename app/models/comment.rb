class Comment < ApplicationRecord
  belongs_to :account
  belongs_to :post

  validates_presence_of :post_id
  validates_presence_of :account_id
  validates_presence_of :comment

  after_create :increment_post_comments_count

  private

  def increment_post_comments_count
    Post.find(post_id).increment(:comments_count).save
  end
end
