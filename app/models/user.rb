class User < ActiveRecord::Base
	has_one :avatar
	has_secure_password
end