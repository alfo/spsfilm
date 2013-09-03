class AddUserIdToGear < ActiveRecord::Migration
  def change
    add_column :gears, :user_id, :integer
  end
end
