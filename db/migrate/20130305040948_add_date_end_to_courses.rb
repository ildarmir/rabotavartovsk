class AddDateEndToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :description, :text  
    add_column :courses, :date_end, :date
  end
end
