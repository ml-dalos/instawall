class Account < ApplicationRecord
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable

  mount_uploader :avatar, ImageUploader
  has_many :posts
  has_many :likes

  def full_name
    [first_name, last_name].compact.join(' ')
  end

  def total_followers
    0
  end

  def total_following
    0
  end
end
