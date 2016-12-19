class Favorite < ApplicationRecord
  belongs_to :product
  belongs_to :user

<<<<<<< HEAD
=======
  validates_presence_of :product_id, :user_id
>>>>>>> 3dd493362e3d1c064b9e1c932310a9293409f12f
  validates_uniqueness_of :user_id, scope: :product_id
end
