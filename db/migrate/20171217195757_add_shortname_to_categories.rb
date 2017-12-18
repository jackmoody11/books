class AddShortnameToCategories < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :shortname, :string
  end
end
