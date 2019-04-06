class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|

      t.belongs_to :clinic
      t.belongs_to :owner
      t.string :name
      t.string :breed
      t.string :desc

      t.timestamps
    end
  end
end
