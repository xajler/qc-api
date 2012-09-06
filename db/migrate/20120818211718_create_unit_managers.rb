class CreateUnitManagers < ActiveRecord::Migration
  def change
    create_table :unit_managers do |t|
      t.references :user
      t.references :unit

      t.timestamps
    end
    add_index :unit_managers, :user_id
    add_index :unit_managers, :unit_id
  end
end
