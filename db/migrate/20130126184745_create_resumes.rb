class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.string :login
      t.string :password
      t.string :position
      t.string :name
      t.string :sex
      t.string :mar_status
      t.string :age
      t.string :experience
      t.string :city
      t.string :min_wage
      t.string :schedule
      t.text :skills
      t.text :education
      t.text :about
      t.string :phone
      t.string :email
      t.string :date
      t.integer :view
      t.string :avatar
      t.integer :group_id, :default => 1

      t.timestamps
    end
  end
end
