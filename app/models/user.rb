class User < ApplicationRecord
  validates_presence_of :username, :email, :password_digest
  has_many :ideas
  has_secure_password

  enum role: ['default', 'admin']
end
