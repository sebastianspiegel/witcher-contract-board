class Type < ApplicationRecord
    has_many :monsters 


    # def most_prevelent_type
    #     # Contract.joins(monster)on(monster_id)where(locatoin_id = self.id).count

    #     # Contract.joins("INNER JOIN monsters ON monsters.")
    #     # Monster.joins("INNER JOIN contracts ON contracts.monster_id = monsters.id WHERE contracts.location_id = ? AND monsters.type_id = ?")

    #     # SELECT * FROM monsters INNER JOIN contracts ON contracts.monster_id = monsters.id ORDER BY monsters.type_id
    # end

end
