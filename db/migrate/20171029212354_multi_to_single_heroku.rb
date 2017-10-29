class MultiToSingleHeroku < ActiveRecord::Migration[5.1]
  def change
    remove_column :listings, :images, :json
    change_table :listings do |t|
      t.string :image
    end
  end
end
