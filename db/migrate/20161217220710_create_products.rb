class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :brand
      t.string :size
      t.string :

      t.timestamps
    end
  end
end
