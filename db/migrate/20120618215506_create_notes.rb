class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :guest_id
      t.integer :user_id
      t.boolean :star
      t.string :description

      t.timestamps
    end
  end
end
