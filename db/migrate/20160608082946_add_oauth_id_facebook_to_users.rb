class AddOauthIdFacebookToUsers < ActiveRecord::Migration
  def change
    add_column :users, :oauth_id_facebook, :string
  end
end
