class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.boolean :access_enabled
      t.string :app
      t.string :password
      t.string :user_type
      t.string :location
      t.integer :average_minutes_used_last_30_days
      t.decimal :fees_last_30_days
      t.datetime :initial_access
      t.datetime :last_access
      t.timestamps
    end
  end
end
