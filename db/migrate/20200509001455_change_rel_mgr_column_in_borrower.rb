class ChangeRelMgrColumnInBorrower < ActiveRecord::Migration[6.0]
  def change
    rename_column :borrowers, :rel_mgr_id, :relationship_mgr_id
  end
end
