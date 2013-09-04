require 'bcrypt'

class User < ActiveRecord::Base

	attr_accessor :password, :current_password
	
	has_many :requests
	has_many :packages
	has_many :gear
	
	validates :email, :presence => true, :email => true, :uniqueness => true
	validates :password, :presence => true, :length => {:minimum => 6}
	
	before_save :encrypt_password
	before_create :defaults
	before_create :make_activation_token
	
	def make_activation_token
		generate_token(:activation_token)
	end
	
	def send_password_reset
	  	generate_token(:password_reset_token)
	  	save!(:validate => false)
	  	UserMailer.password_reset(self).deliver
	end
	
	def self.authenticate(email, password)
		user = User.find_by_email(email)
		if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
			user
		else
			nil
		end
	end
	
	def encrypt_password
		unless self.password.nil?
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
		end
	end
	
	protected
	def generate_token(column)
		begin
			self[column] = SecureRandom.urlsafe_base64
		end while User.exists?(column => self[column])
	end
	
	def defaults
		
	end

end

