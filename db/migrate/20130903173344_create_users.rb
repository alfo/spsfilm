class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.boolean :is_admin
      t.string :password_hash
      t.string :password_salt

      t.timestamps
    end
  end
end
