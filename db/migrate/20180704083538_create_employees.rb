class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :name, null: false
      t.string :title, null: false
      t.references :company, foreign_key: true
      t.timestamps
    end
  end
end
