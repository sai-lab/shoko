class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string :title, null: false, default: ""
      t.text :markdown, null: false, default: ""

      t.timestamps null: false
    end
  end
end
