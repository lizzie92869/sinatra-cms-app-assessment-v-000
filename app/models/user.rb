class User < ActiveRecord::Base
	belongs_to :avatar
	has_secure_password
end