class Listing < ActiveRecord::Base
	has_many :tags, through: :categories
	has_many :categories, dependent: :destroy
	has_many :reservations, dependent: :destroy
	belongs_to :user
	scope :featured, -> {order('reservations_count ASC')}
	mount_uploaders :avatars, AvatarUploader
end
