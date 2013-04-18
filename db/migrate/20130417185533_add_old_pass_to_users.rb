class AddOldPassToUsers < ActiveRecord::Migration
  def change
  end
  add_column :users, :old_pass, :string, :length => 32
end
