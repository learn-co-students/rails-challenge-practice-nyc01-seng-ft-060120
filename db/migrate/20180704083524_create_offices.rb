class CreateOffices < ActiveRecord::Migration[5.1]
  def change
    create_table :offices do |t|
      t.references :building, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true
      t.integer :floor, null: false
      t.timestamps
    end
  end
end
