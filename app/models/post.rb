class Post < ApplicationRecord
  validates :image, presence: true
  belongs_to :account
  mount_uploader :image, ImageUploader

  scope :active, -> { where active: true }
end
