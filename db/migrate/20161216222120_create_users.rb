class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      # database constraits should match model validations
      # e.g.: uniqueness, etc.
      t.string :username, null: false
      t.string :password_digest, null: false
      t.string :email, null: false
      t.string :aboutme
      t.timestamps
    end
  end
end
