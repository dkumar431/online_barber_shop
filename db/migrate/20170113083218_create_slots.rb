class CreateSlots < ActiveRecord::Migration
  def change
    create_table :slots do |t|
      t.float :start_time
      t.float :end_time
      t.boolean :status

      t.timestamps null: false
    end
  end
end
