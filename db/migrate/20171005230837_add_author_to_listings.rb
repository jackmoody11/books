class AddAuthorToListings < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :author, :string
  end
end
