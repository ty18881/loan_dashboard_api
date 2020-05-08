class AddForeignKeyToBorrower < ActiveRecord::Migration[6.0]
  def change
    add_column :borrowers, :rel_mgr_id, :integer

  end
end
