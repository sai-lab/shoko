class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :title, null: false, default: ""
      t.text :markdown, null: false, default: ""
      t.boolean :draft_flag, null: false, default: false

      t.timestamps null: false
    end
  end
end
