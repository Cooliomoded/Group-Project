class CreateBattles < ActiveRecord::Migration[6.0]
  def change
    create_table :battles do |t|
      t.string :location
      t.datetime :date
      t.integer :hero_id
      t.integer :villain_id
      t.boolean :hero_win
      t.boolean :destruction
      t.float :destruction_severity
      t.boolean :hero_created
      t.boolean :villain_created
    end
  end
end
