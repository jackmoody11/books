class AddOptionalUserInfo < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :summary
      t.integer :grad_year
    end
  end
end
