class AddDefaultsToUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :access_enabled, :boolean, default: true
    change_column :users, :user_type, :string, default: 'user'
    change_column :users, :average_minutes_used_last_30_days, :integer, default: 0
    change_column :users, :fees_last_30_days, :decimal, default: 0.0
    change_column :users, :initial_access, :datetime, default: -> { 'CURRENT_TIMESTAMP' }
    change_column :users, :last_access, :datetime, default: -> { 'CURRENT_TIMESTAMP' }

    # Also delete some columns
    remove_column :users, :app, :string
  end
end
