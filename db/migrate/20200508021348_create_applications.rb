class CreateApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :applications do |t|
      t.date :submit_date
      t.date :decision_date
      t.date :review_date
      t.string :status

      t.timestamps
    end
  end
end
