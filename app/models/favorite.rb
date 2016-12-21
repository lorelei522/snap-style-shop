class Favorite < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates_presence_of :product_id, :user_id
  validates_uniqueness_of :user_id, scope: :product_id
  # validate the existence of the associated user
  # validate the existence of the associated product
end
