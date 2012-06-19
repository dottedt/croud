class AddCourseTableWithCorrections < ActiveRecord::Migration
  def up
    create_table :courses do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.boolean :monday
      t.boolean :tuesday
      t.boolean :wednesday
      t.boolean :thursday
      t.boolean :friday
      t.boolean :saturday
      t.boolean :sunday

      t.timestamps
    end
  end

  def down
    drop_table :courses
  end
end
