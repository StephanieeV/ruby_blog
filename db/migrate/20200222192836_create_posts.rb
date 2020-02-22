class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.date :date
      t.string :introduction
      t.string :body
      t.string :picture
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
