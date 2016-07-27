class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.belongs_to :listing
      t.belongs_to :tag
      t.timestamps null: false
    end
  end
end
