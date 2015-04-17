class RecoverableUsers < ActiveRecord::Migration
  def up
    add_column :users, :email, :string, null: false, default: ""
    add_column :users, :reset_password_token, :string
    add_column :users, :reset_password_sent_at, :datetime

    User.all.each do |user|
      if user.email.empty?
        user.update email: "#{user.account}@example.com"
      end
    end

    add_index :users, :email, unique: true
  end

  def down
    remove_column :users, :email
    remove_column :users, :reset_password_token
    remove_column :users, :reset_password_sent_at

    remove_index :users, :email
  end
end
