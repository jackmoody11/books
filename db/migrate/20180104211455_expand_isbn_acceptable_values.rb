class ExpandIsbnAcceptableValues < ActiveRecord::Migration[5.1]
  def change
     change_column :listings, :isbn, :integer, limit: 8
   end
end
