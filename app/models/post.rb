class Post < ApplicationRecord
  validates :image, presence: true
  belongs_to :account
  has_many :likes
  mount_uploader :image, ImageUploader

  scope :active, -> { where(active: true).order(created_at: :desc) }
end