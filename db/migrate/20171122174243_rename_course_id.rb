class RenameCourseId < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :shortname, :string
    remove_column :courses, :course_id
  end
end
