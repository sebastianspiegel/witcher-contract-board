module MonstersHelper

    def display_weaknesses
        @monster.weaknesses.each do |weakness|
            "#{weakness.name} - (#{weakness.weakness_type.name})"
        end
    end

end
