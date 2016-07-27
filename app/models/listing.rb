class Listing < ActiveRecord::Base
	has_many :tags, through: :categories
	has_many :categories
	has_many :reservations
	belongs_to :user
	scope :featured, -> {order('reservations_count ASC')}
	mount_uploaders :avatars, AvatarUploader
end
