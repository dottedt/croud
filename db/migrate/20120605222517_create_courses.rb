class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.date :monday
      t.date :tuesday
      t.date :wednesday
      t.date :thursday
      t.date :friday
      t.date :saturday
      t.date :sunday

      t.timestamps
    end
  end
end
