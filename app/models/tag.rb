class Tag < ActiveRecord::Base
	has_many :listings, through: :categories
	has_many :categories
end
