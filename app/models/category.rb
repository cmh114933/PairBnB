class Category < ActiveRecord::Base
	belongs_to :tag, dependent: :destroy
	belongs_to :listing
end
