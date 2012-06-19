class RemoveUserImageFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :user_image
    
  end
end
