class CreateSpells < ActiveRecord::Migration[5.2]
  def change
    create_table :spells do |t|
      t.text :description
      t.text :higher_level
      t.text :range
      t.text :casting_time
      t.text :classes

      t.timestamps
    end
  end
end
