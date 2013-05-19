class AddViewToVacancies < ActiveRecord::Migration
  def change
  add_column :vacancies, :view, :int
  end
end
