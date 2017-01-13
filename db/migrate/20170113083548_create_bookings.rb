class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :customer, index: true, foreign_key: true
      t.references :slot, index: true, foreign_key: true
      t.boolean :status

      t.timestamps null: false
    end
  end
end
