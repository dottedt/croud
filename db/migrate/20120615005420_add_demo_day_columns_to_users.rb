class AddDemoDayColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :learned, :text
    add_column :users, :built, :text
    add_column :users, :what_next, :text
    add_column :users, :before_ca, :text
    
  end
end
