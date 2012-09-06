class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :name, limit: 50
      t.string :description, limit: 255
      t.boolean :active
      t.boolean :not_deleted
      t.references :parent
      t.references :tenant

      t.timestamps
    end

    add_index :units, :tenant_id
    add_index :units, :parent_id
  end
end
