class CreateUserPlants < ActiveRecord::Migration
  def change
    create_table :user_plants do |t|
      t.integer :user_id, null: false
      t.integer :plant_id, null: false

      t.timestamps null: false
    end
  end
end
