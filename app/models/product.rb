class Product < ApplicationRecord
  validates_presence_of  :image, :link, :name, :price
  validates_uniqueness_of :name

  has_many :favorites
end
