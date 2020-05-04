class Like < ApplicationRecord
  belongs_to :account
  belongs_to :post
  validates_uniqueness_of :post_id, scope: :account_id

  after_create :increment_post_likes_count
  before_destroy :decrement_post_likes_count

  private

  def increment_post_likes_count
    Post.find(post_id).increment(:likes_count).save
  end

  def decrement_post_likes_count
    Post.find(post_id).decrement(:likes_count).save
  end
end
