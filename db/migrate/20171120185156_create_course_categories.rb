class CreateCourseCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :course_categories do |t|
        t.integer "category_id"
        t.integer "course_id"
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
    end
  end
end
