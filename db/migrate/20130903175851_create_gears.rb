class CreateGears < ActiveRecord::Migration
  def change
    create_table :gears do |t|
      t.string :name
      t.text :description
      t.string :serial
      t.float :value

      t.timestamps
    end
  end
end
