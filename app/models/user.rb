class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true
  validates :password, presence: true
  validates :password_digest, presence: true
  
  has_many :favorites
end
