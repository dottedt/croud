class AddQuarterToUsers < ActiveRecord::Migration
  def change
    add_column :users, :quarter, :string
  end
end
