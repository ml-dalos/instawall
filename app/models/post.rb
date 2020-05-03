class Post < ApplicationRecord
  belongs_to :account
  mount_uploader :image, ImageUploader

  scope :active, -> { where active: true }
end
