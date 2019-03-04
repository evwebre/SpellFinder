class AddNameToSpells < ActiveRecord::Migration[5.2]
  def change
    add_column :spells, :name, :text
  end
end
