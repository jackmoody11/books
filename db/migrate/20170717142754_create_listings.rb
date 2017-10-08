class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.string :title
      t.string :condition
      t.integer :price
      t.text :description

      t.timestamps
    end
  end
end
