class CreateOfficeEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :office_employees do |t|
      t.references :offices, foreign_key: true
      t.references :companies, foreign_key: true
    end
  end
end
