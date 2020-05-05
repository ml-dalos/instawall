class Post < ApplicationRecord
  validates :image, presence: true
  belongs_to :account
  has_many :likes
  has_many :comments
  mount_uploader :image, ImageUploader

  scope :active, -> { where(active: true).order(created_at: :desc) }
end