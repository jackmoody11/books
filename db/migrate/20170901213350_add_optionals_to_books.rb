class AddOptionalsToBooks < ActiveRecord::Migration[5.1]
  def change
    change_table :listings do |t|
      t.integer :isbn
    end
  end
end
