class User < ActiveRecord::Base
	belongs_to :female_avatar
	belongs_to :male_avatar
	has_secure_password
	validates_presence_of :username
	validates_presence_of :password
	validates_presence_of :email
end