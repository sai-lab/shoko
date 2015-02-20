class CreateUserDocuments < ActiveRecord::Migration
  def change
    create_table :user_documents do |t|
      t.references :user, index: true, null: false
      t.references :document, index: true, null: false

      t.timestamps null: false
    end

    add_foreign_key :user_documents, :users
    add_foreign_key :user_documents, :documents
  end
end
