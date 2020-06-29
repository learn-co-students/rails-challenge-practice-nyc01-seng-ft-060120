class CreateBuildings < ActiveRecord::Migration[5.1]
  def change
    create_table :buildings do |t|
      t.string :name, null: false
      t.string :country, null: false
      t.string :address, null: false
      t.integer :rent_per_floor, null: false
      t.integer :number_of_floors, null: false

      t.timestamps
    end
  end
end
