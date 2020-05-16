class CreateCatRentalRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :cat_rental_requests do |t|
      t.date :start_date, null: false
      t.references :cat, foreign_key: true, null: false
      t.date :end_date, null: false
      t.string :status, null: false, default: "PENDING"

      t.timestamps
    end
    # add_index :cat_rental_requests, :cat_id
  end
end
