class AddOmniauthToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :app_access_token, :string
    add_column :users, :app_refresh_token, :string
    add_column :users, :app_expires_at, :datetime

    add_index :users, [:provider, :uid], unique: true
  end
end
