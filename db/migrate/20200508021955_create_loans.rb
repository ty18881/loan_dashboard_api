class CreateLoans < ActiveRecord::Migration[6.0]
  def change
    create_table :loans do |t|
      t.decimal :principal_amount
      t.decimal :interest_rate
      t.date :maturity_date
      t.integer :term

      t.timestamps
    end
  end
end
