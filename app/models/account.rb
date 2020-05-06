class Account < ApplicationRecord
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[github]

  mount_uploader :avatar, ImageUploader
  has_many :posts
  has_many :likes
  has_many :comments

  def full_name
    [first_name, last_name].compact.join(' ')
  end

  def total_followers
    Follower.where(following_id: id).count
  end

  def total_following
    Follower.where(follower_id: id).count
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |account|
      account.provider = auth.provider
      account.uid = auth.uid
      account.first_name = auth.info.name.split(' ').first
      account.last_name = auth.info.name.split(' ').last
      account.username = auth.info.nickname
      account.email = auth.info.email || "#{auth.info.nickname}@github.com"
      account.password = Devise.friendly_token[0, 20]
    end
  end
end