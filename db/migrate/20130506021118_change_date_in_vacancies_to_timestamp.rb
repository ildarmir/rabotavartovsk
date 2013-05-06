class ChangeDateInVacanciesToTimestamp < ActiveRecord::Migration
  def up
  end
  remove_column :vacancies, :date
  add_column :vacancies, :date, :timestamp

  def down
  end
end
