class Reservation < ActiveRecord::Base
	belongs_to :user
	belongs_to :listing, counter_cache: true
end
