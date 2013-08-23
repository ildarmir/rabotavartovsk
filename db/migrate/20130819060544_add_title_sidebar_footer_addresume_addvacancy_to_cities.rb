class AddTitleSidebarFooterAddresumeAddvacancyToCities < ActiveRecord::Migration
  def change
    add_column :cities, :title, :string
    add_column :cities, :sidebar, :text
    add_column :cities, :footer, :text
    add_column :cities, :addresume, :text
    add_column :cities, :addvacancy, :text
  end
end
