class CreateFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
      # database constraits should match model validations
      # e.g.: uniqueness, etc.

      # heads up: t.references creates the foreign key
      # and indexes the key, but does NOT explicitly
      # set
      t.references :user, foreign_key: true
      t.references :product

      t.timestamps
    end
  end
end
