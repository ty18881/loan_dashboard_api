class AddForeignKeyToBorrowers < ActiveRecord::Migration[6.0]
  def change
    add_column :borrowers, :application_id, :integer
    add_foreign_key :borrowers, :applications
  end
end
