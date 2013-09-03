class NewAssocs < ActiveRecord::Migration
  def change
  	create_table :gears_requests do |t|
  		t.belongs_to :gear
  		t.belongs_to :request
  	end
  	
  	create_table :gears_packages do |t|
  		t.belongs_to :gear
  		t.belongs_to :package
  	end
  end
end
