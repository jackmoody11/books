class AddAvatarsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :images, :json
    remove_column :listings, :image
  end
end
