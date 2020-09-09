class CreateHeros < ActiveRecord::Migration[6.0]
  def change
    create_table :heros do |t|
      t.string :name
      t.string :alter_ego
      t.string :super_power
      t.integer :power_lvl
      t.integer :resistance
      t.integer :hp
      t.string :gender
      t.string :race
      t.text :origin_story
      t.string :nemesis
    end
  end
end
