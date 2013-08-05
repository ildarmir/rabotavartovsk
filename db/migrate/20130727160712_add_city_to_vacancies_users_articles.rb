class AddCityToVacanciesUsersArticles < ActiveRecord::Migration
  def change
    add_column :vacancies, city_id, integer, default: 1
    add_column :users, city_id, integer, default: 1
    add_column :articles, city_id, integer, default: 1
  end
end
