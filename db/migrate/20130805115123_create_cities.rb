# coding: utf-8
class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :subdomain
      t.string :name
      t.timestamps
    end

  add_column :vacancies, :city_id, :string
  add_column :resumes, :city_id, :string
  add_column :articles, :city_id, :string
  add_column :users, :city_id, :string
  end
end
