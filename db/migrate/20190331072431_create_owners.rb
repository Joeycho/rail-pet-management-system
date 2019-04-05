class CreateOwners < ActiveRecord::Migration[5.2]
  def change
    create_table :owners do |t|
      t.string :uid
      t.string :name
      t.string :email
      t.string :image
      t.string :password_digest

      t.timestamps
    end
  end
end
