class Subdistrict < ActiveRecord::Base
	has_many	:villages
	has_many	:dpts
end
