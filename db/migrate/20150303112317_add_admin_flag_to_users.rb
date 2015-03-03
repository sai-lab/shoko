class AddAdminFlagToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin_flag, :boolean, null: false, default: false
  end
end
