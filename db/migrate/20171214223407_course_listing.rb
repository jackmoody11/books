class CourseListing < ActiveRecord::Migration[5.1]
  def change
    create_table "course_listings", force: :cascade do |t|
      t.integer "listing_id"
      t.integer "course_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
