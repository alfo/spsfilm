class Package < ActiveRecord::Base
	has_and_belongs_to_many :gears
	belongs_to :user
end
