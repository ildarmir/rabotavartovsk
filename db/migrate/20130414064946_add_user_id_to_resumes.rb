class AddUserIdToResumes < ActiveRecord::Migration
add_column :resumes, :user_id, :integer
add_column :vacancies, :user_id, :integer
  def change
  end
end
