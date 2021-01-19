class CreateWitchersContracts < ActiveRecord::Migration[6.1]
  def change
    create_table :witchers_contracts do |t|
      t.integer :user_id #witcher id
      t.integer :contract_id 

      t.timestamps
    end
  end
end
