class WrongAssocs < ActiveRecord::Migration
  def change
  	drop_table :package_items
  	drop_table :request_items
  end
end
