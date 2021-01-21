# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

DATA = {
    :schools => ["None", "School of the Cat", "School of the Wolf", "School of the Bear", "School of the Viper"],
    :type_keys =>
        ["name", "weakness"],
    :types => [
        ["Vampire", "Igni"],
        ["Specter", "Igni"],
        ["Cursed One", "Quen"],
        ["Draconid", "Aard"],
        ["Elementa", "Aard"],
        ["Hybrid", "Aard"],
        ["Insectoid", "Golden Oriole"],
        ["Necrophages", "Axii"],
        ["Ogroid", "Quen"],
        ["Relict", "Igni"]
    ],
    :locations => ["Velen", "Novigrad", "Vizima", "White Orchard", "Skellige", "Toussant", "Oxenfurt"],
    :users => ["Zoltan Chivay", "Dandelion", "Vernon Roche", "Triss Merigold", "Keira Metz"],
    :monster_keys =>
        ["name", "type_id"],
    :monsters => [
        ["Jenny o' the woods", 2],
        ["Dracula", 1],
        ["Wham Wham", 9]
    ],
    :witcher_keys => 
        ["name", "school_id", "password"],
    :witchers => [
        ["Geralt", 2, "password"], 
        ["Lambert", 2, "password"], 
        ["Eskel", 2, "password"],
        ["Letho", 5, "password"]
    ],
    :contract_keys =>
        ["reward", "details", "user_id", "monster_id", "location_id"],
    :contracts => [
        [100, "Wraith in the woods", 1, 1, 1],
        [50, "Missing lute last seen being whisked away by a man with bloody fangs.", 2, 2, 2],
        [150, "Trolls in the woods causing problems", 3, 3, 1]
    ]
}

def main 
    make_schools
    make_locations
    make_types
    make_monsters
    make_users
    make_witchers 
    make_contracts 
    assign_contracts
end

def make_schools
    DATA[:schools].each do |school|
        School.create(name: school)
    end
end

def make_users
    DATA[:users].each do |name|
        User.create(name: name, school_id: 1, password: 'password')
    end
end

def make_witchers
    DATA[:witchers].each do |witcher|
        new_witcher = User.new
        witcher.each_with_index do |attribute, i|
            new_witcher.send(DATA[:witcher_keys][i]+"=", attribute)
        end
        new_witcher.save
    end
end

def make_locations
    DATA[:locations].each do |name|
        Location.create(name: name)
    end
end

def make_types
    DATA[:types].each do |type|
        new_type = Type.new
        type.each_with_index do |attribute, i|
          new_type.send(DATA[:type_keys][i]+"=", attribute)
        end
        new_type.save
      end
end

def make_monsters
    DATA[:monsters].each do |monster|
        new_monster = Monster.new
        monster.each_with_index do |attribute, i|
            new_monster.send(DATA[:monster_keys][i]+"=", attribute)
        end
        new_monster.save 
    end
end

def make_contracts
    DATA[:contracts].each do |contract|
        new_contract = Contract.new
        contract.each_with_index do |attribute, i|
            new_contract.send(DATA[:contract_keys][i]+"=", attribute)
        end
        new_contract.save 
    end
end

def assign_contracts
    Contract.first.witcher_id = User.find(6)
end

main
