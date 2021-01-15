class CreateContracts < ActiveRecord::Migration[6.1]
  def change
    create_table :contracts do |t|
      t.string :name
      t.integer :reward
      t.string :claimed, default: "Unclaimed" 
      t.integer :user_id
      t.integer :monster_id
      t.integer :location_id

      t.timestamps
    end
  end
end
