class AddNameToWebHooks < ActiveRecord::Migration
  def change
    add_column :web_hooks, :name, :string, null: false, default: ""
  end
end
