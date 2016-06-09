class CreatePowerLogs < ActiveRecord::Migration
  def change
    create_table :power_logs do |t|
      t.integer  :plant_id, null: false
      t.decimal  :voltage, precision: 20, scale: 4
      t.decimal  :ampere,  precision: 20, scale: 4
      t.decimal  :watt,    precision: 30, scale: 4, null: false
      t.string   :creator_info
      t.datetime :logged_at, null: false

      t.timestamps null: false
    end
  end
end
