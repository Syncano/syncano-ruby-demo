class CreateNotificationSettings < ActiveRecord::Migration
  def change
    create_table :notification_settings do |t|
      t.references :user, null: false
      t.references :category, null: false
      t.decimal :min_price
      t.decimal :max_price

      t.timestamps
    end

    add_foreign_key :notification_settings, :users
    add_foreign_key :notification_settings, :categories

    add_index :notification_settings, [:min_price, :max_price]
  end
end
