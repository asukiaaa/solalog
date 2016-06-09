class CreatePowerLogs < ActiveRecord::Migration
  def change
    create_table :power_logs do |t|
      t.integer :plant_id, null: false
      t.decimal :voltage, precision: 20, scale: 4, null: false
      t.decimal :ampere,  precision: 20, scale: 4, null: false
      t.datetime :logged_at, null: false
      t.string :creator_info

      t.timestamps null: false
    end
  end
end
