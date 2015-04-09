class AddGradeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :grade, :int, null: false, default: 1
  end
end
