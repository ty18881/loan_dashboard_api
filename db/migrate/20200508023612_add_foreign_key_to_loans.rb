class AddForeignKeyToLoans < ActiveRecord::Migration[6.0]
  def change
    add_column :loans, :application_id, :integer
  end
end
