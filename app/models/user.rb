class User < ActiveRecord::Base
  has_many :giftees
  has_secure_password

  validates :name, presence: true
  validates :password, presence: true
end
