class ChangeUserVideoToText < ActiveRecord::Migration
  def change
    change_column :users, :video, :text
  end
end
