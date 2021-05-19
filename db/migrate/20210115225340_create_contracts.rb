class CreateContracts < ActiveRecord::Migration[6.1]
  def change
    create_table :contracts do |t|
      t.integer :reward
      t.text :details 
      t.integer :user_id
      t.integer :monster_id
      t.integer :location_id
      t.integer :witcher_id

      t.timestamps
    end
  end
end
