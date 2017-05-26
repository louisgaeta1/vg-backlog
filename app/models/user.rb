class User < ActiveRecord::Base
  validates :username, :email, uniqueness: true, presence: true
  validates :password_digest, presence: true
  has_secure_password
  has_many :backlog_items
end
