class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :user, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false

      t.timestamps
    end

    add_foreign_key :profiles, :users
  end
end
