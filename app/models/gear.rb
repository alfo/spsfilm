class Gear < ActiveRecord::Base
	has_and_belongs_to_many :requests
	has_and_belongs_to_many :packages
end
