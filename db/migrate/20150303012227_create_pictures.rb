class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.attachment :attachment
      t.timestamps null: false
    end
  end
end
