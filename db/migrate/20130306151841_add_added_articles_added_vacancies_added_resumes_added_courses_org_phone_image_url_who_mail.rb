class AddAddedArticlesAddedVacanciesAddedResumesAddedCoursesOrgPhoneImageUrlWhoMail < ActiveRecord::Migration
  def change
    add_column :users, :who, :boolean
    add_column :users, :org, :string
    add_column :users, :phones, :integer
    add_column :users, :mail, :string
    add_column :users, :image_url, :string
    add_column :users, :vacancies_added, :text
    add_column :users, :resumes_added, :text
    add_column :users, :courses_added, :text
    add_column :users, :article_added, :text
  end
end
