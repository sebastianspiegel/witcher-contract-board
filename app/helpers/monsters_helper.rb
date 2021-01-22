module MonstersHelper

    def self.display_weaknesses
        find_weaknesses.each {|w| w.name}
    end

end
