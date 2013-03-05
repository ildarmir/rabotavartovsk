class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title, limit: 256
      t.string :place, limit: 256
      t.string :format, limit: 256
      t.date :date
      t.date :date_end
      t.integer :price, limit: 10
      t.text :description, limit: 2000

      t.timestamps
    end
  end
end
