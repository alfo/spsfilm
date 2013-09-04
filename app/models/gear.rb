class Gear < ActiveRecord::Base
	has_and_belongs_to_many :requests
	has_and_belongs_to_many :packages
	belongs_to :user
	
	validates :name, :presence => true
	validates :description, :presence => true
	validates :value, :presence => true
	
	def belongs_to(user)
		return self.user == user
	end
end
