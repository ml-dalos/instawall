class Post < ApplicationRecord
  validates :image, presence: true
  belongs_to :account
  mount_uploader :image, ImageUploader

  scope :active, -> { where(active: true).order(created_at: :desc) }

  def total_likes
    1000
  end
end
