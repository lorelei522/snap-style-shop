class User < ApplicationRecord
  has_secure_password
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates_format_of :email, :with => EMAIL_REGEX, :on => :create
  validates_length_of :password, :in => 6..20, :on => :create
  validates_presence_of :username, :email
  validates_uniqueness_of :email, :username

end
