class Reservation < ActiveRecord::Base
	belongs_to :user
	belongs_to :listing, dependent: :destroy, counter_cache: true
end
