class DropCourseTable < ActiveRecord::Migration
  def up
   drop_table :courses
  end

  def down
    add_table :courses
  end
end
