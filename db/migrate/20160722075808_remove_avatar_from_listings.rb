class RemoveAvatarFromListings < ActiveRecord::Migration
  def change
    remove_column :listings, :avatar, :string
  end
end
