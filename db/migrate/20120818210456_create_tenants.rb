class CreateTenants < ActiveRecord::Migration
  def change
    create_table :tenants do |t|
      t.string :name, limit: 50
      t.string :description, limit: 50
      t.string :email, limit: 50
      t.string :phone, limit: 50
      t.string :address, limit: 50
      t.string :main_contact, limit: 50
      t.boolean :active
      t.boolean :not_deleted
      t.string :custom_name_for_tenant, limit: 30
      t.string :custom_name_for_unit, limit: 30
      t.string :custom_name_for_template, limit: 30
      t.string :customer_id, limit: 50
      t.string :customer_code, limit: 50
      t.datetime :license_expiry_date
      t.integer :licenses_total
      t.integer :licenses_used

      t.timestamps
    end
  end
end