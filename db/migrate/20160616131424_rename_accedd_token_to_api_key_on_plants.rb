class RenameAcceddTokenToApiKeyOnPlants < ActiveRecord::Migration
  def change
    rename_column :plants, :access_token, :api_key
  end
end
