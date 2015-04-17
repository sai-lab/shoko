class RecoverableUsers < ActiveRecord::Migration
  def change
    change_table(:users) do |t|
      t.string :email, null: false, default: ""
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
    end

    add_index :users, :email, unique: true
  end
end
