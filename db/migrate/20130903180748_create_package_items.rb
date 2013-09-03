class CreatePackageItems < ActiveRecord::Migration
  def change
    create_table :package_items do |t|
      t.string :gear_id
      t.integer :package_id

      t.timestamps
    end
  end
end
