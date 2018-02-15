class User < ApplicationRecord
  validates_presence_of :username, :email, :password_digest
  validates_uniqueness_of :username, :email
  has_many :ideas, dependent: :destroy
  has_secure_password

  enum role: ['default', 'admin']
end
