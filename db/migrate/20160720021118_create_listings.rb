class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :locations
      t.integer :prices
      t.integer :num_of_rooms
      t.integer :num_of_guests
      t.date :available_dates , array:true 
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end
