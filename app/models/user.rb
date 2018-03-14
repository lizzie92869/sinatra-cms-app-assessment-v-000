class User < ActiveRecord::Base
	belongs_to :female_avatar
	belongs_to :male_avatar
	has_secure_password
end