class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, limit: 102
      t.string :first_name, limit: 50
      t.string :last_name, limit: 50
      t.string :email, limit: 100
      t.boolean :active
      t.boolean :not_deleted
      
      #t.references :recorder_player
      t.string :recorder_user_id, limit: 500
      t.string :recorder_account_id, limit: 500
      t.references :tenant
      
      t.timestamps
    end
    add_index :users, :tenant_id
    #add_index :users, :recorder_player_id
  end
end
