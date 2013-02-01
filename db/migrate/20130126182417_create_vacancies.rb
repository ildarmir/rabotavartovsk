class CreateVacancies < ActiveRecord::Migration
  def change
    create_table :vacancies do |t|
      t.string :position
      t.text :note
      t.string :experience
      t.string :salary
      t.string :organisation
      t.string :phone
      t.timestamp :date
      t.string :email

      t.timestamps
    end
  end
end
