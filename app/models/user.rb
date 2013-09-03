class User < ActiveRecord::Base
	has_many :requests
	has_many :packages
	has_many :gear
end
