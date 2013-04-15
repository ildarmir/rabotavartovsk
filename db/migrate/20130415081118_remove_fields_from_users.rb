class RemoveFieldsFromUsers < ActiveRecord::Migration
  def up
  end
remove_column :users,:who
remove_column :users,:org
remove_column :users,:phones
remove_column :users,:image_url
remove_column :users,:vacancies_added
remove_column :users,:resumes_added
remove_column :users,:courses_added
remove_column :users,:article_added
  def down
  end
end
