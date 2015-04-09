class AddNameAndPatternToTempltates < ActiveRecord::Migration
  def change
    add_column :templates, :name, :string, null: false, default: ""
    add_column :templates, :pattern, :string, default: ""
  end
end
