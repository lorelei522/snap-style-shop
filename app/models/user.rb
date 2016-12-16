class User < ApplicationRecord
  has_secure_password
  attr_accessor :image_file_name
  has_attached_file :image , styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates_format_of :email, :with => EMAIL_REGEX, :on => :create
  validates_length_of :password, :in => 6..20, :on => :create
  validates_presence_of :username, :email
  validates_uniqueness_of :email, :username

end
