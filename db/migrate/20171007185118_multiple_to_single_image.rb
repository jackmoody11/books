class MultipleToSingleImageForHeroku < ActiveRecord::Migration[5.1]
  def change
    remove_column :listings, :images, :json
  end
end
