class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :hometown
      t.text :quote
      t.string :quote_author
      t.integer :phone
      t.string :email
      t.string :twitter
      t.string :facebook
      t.string :linkedin
      t.string :github
      t.string :fav_book
      t.text :why_ca
      t.text :culture
      t.text :app_idea
      t.string :image
      t.string :mentor_assigned
      t.string :demo_day_team
      t.string :website
      t.string :user_image

      t.timestamps
    end
  end
end
