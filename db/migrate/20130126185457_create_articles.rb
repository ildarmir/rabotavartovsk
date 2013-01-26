class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :des
      t.text :text
      t.integer :view
      t.string :author
      t.string :mini_img
      t.integer :add_time

      t.timestamps
    end
  end
end
