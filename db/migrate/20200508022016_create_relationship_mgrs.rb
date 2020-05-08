class CreateRelationshipMgrs < ActiveRecord::Migration[6.0]
  def change
    create_table :relationship_mgrs do |t|
      t.string :name
      t.string :state
      t.integer :employee_id

      t.timestamps
    end
  end
end
