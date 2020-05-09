class AddForeignKeyToApplication < ActiveRecord::Migration[6.0]
  def change
    add_column :applications, :borrower_id, :integer
  end
end
