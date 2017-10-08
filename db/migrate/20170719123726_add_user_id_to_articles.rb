class AddUserIdToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :user_id, :integer
  end
end
