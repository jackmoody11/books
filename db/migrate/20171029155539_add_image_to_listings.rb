class AddImageToListings < ActiveRecord::Migration[5.1]
  def change
    change_table :listings do |t|
      t.string :image
    end
  end
end
