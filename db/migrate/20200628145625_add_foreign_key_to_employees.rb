class AddForeignKeyToEmployees < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :employees, :companies, column: :company_id, primary_key: :employee_id
  end
end
