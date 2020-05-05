class Comment < ApplicationRecord
  belongs_to :account
  belongs_to :post

  validates_presence_of :post_id
  validates_presence_of :account_id
  validates_presence_of :comment
end
