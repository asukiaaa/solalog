class CreatePlants < ActiveRecord::Migration
  def change
    create_table :plants do |t|
      t.string :uuid, null: false
      t.string :name, null: false
      t.text :description
      t.string :access_token, null: false

      t.timestamps null: false
    end

    add_index :plants, :uuid, unique: true
  end
end
