class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :breed
      t.string :animal_type
      t.references :shelter, null: false, foreign_key: true
      t.boolean :is_adopted

      t.timestamps
    end
  end
end