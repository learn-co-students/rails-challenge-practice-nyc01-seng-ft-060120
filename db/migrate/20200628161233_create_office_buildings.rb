class CreateOfficeBuildings < ActiveRecord::Migration[5.1]
  def change
    create_table :office_buildings do |t|
      t.references :buildings, foreign_key: true
      t.references :companies, foreign_key: true
    end
  end
end
