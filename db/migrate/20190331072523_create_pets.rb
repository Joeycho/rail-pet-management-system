class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|

      t.belongs_to :clinic, index: true, foreign_key: true
      t.belongs_to :owner, index: true, foreign_key: true
      t.string :name
      t.string :desc

      t.timestamps
    end
  end
end
