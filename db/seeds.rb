# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

DATA = {
    :type_keys =>
        ["name", "weakness"],
    :types => [
        ["Vampire", "Vampirc Oil"],
        ["Ogers", ""],
        ["Relics", ""],
        ["Wraiths", ""],
        ["Old Ones", ""]
    ],
    :locations => [
        ["Velen"],
        ["Novigrad"]
    ],
    :user_keys =>
        ["name", "password"],
    :users => [
        ["Example", "password"],
        ["Another", "password"]
    ],
    :monster_keys =>
        ["name", "type_id"],
    :monsters => [
        ["Jenny o' the woods", 4]
    ],
    :witchers => [
        "Geralt",
        "Lambert",
        "Eskel"
    ],
    :contract_keys =>
        ["reward", "user_id", "monster_id", "location_id"],
    :contracts => [
        [100, ]
    ]
}

def main 
    # make_users
    # make_witchers
    # make_locations
    # make_types
    # make_monsters 
    # make_contracts 
end

def make_users
    DATA[:users].each do |user|
        new_user = User.new
        user.each_with_index do |attribute, i|
          new_user.send(DATA[:user_keys][i]+"=", attribute)
        end
        new_user.save
      end
end

def make_witchers
    DATA[:witchers].each do |name|
      User.create(name: name, witcher: 1, password: 'password')
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
end

main
