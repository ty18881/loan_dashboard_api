class CreateAppsubmits < ActiveRecord::Migration[6.0]
  def change
    create_table :appsubmits do |t|
      t.date :submit_date
      t.integer :count

      t.timestamps
    end
  end
end
