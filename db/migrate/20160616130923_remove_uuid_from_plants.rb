class RemoveUuidFromPlants < ActiveRecord::Migration
  def change
    remove_column :plants, :uuid, :string
  end
end
