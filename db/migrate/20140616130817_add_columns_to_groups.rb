class AddColumnsToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :about, :text
    add_column :groups, :ubicacion, :string
  end
end
