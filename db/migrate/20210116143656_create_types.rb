class CreateTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :types do |t|
      t.string :name
      t.string :weakness 

      t.timestamps
    end
  end
end
