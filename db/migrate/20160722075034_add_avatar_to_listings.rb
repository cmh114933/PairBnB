class AddAvatarToListings < ActiveRecord::Migration
  def change
    add_column :listings, :avatar, :string
  end
end
