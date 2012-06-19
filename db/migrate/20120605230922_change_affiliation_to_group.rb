class ChangeAffiliationToGroup < ActiveRecord::Migration

def change
  rename_table :affiliations, :groups
end

  def up
  end

  def down
  end
end
