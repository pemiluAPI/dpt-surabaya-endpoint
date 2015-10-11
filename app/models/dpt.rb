class Dpt < ActiveRecord::Base
	belongs_to	:subdistrict
	belongs_to 	:village
end
