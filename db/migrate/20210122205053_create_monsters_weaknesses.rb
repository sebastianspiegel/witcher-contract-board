class CreateMonstersWeaknesses < ActiveRecord::Migration[6.1]
  def change
    create_table :monsters_weaknesses, id: false do |t|
      t.belongs_to :monster 
      t.belongs_to :weakness

      t.timestamps
    end
  end
end
