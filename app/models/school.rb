class School < ActiveRecord::Base
	has_many :reviews

	def rating
		read_attribute(:rating).to_i
	end
end
