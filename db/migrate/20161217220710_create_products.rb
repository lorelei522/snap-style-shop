class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      # database constraits should match model validations
      # e.g.: uniqueness, etc.
      t.string :image, null: false
      t.string :link, null: false
      t.string :name, null: false
      t.string :price, null: false

      t.timestamps
    end
  end
end
