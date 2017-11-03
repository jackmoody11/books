class MultipleToSingleImageForHeroku < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :image, :string
    remove_column :listings, :images
  end
end
