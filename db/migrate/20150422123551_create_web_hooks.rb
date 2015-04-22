class CreateWebHooks < ActiveRecord::Migration
  def change
    create_table :web_hooks do |t|
      t.string :url, null: false, default: ""

      t.timestamps null: false
    end
  end
end
