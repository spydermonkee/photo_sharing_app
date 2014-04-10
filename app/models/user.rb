class User < ActiveRecord::Base
  has_many :posts
  has_many :tags
  has_secure_password

  validates :email, :uniqueness => true, :presence => true
  validates :name, :presence => true
  validates :password_digest, :presence => true


end
