module ContractsHelper

    def all_unclaimed_contracts
        @unclaimed_contracts = []
        Contract.all.each do |contract|
            if !contract.contract_is_claimed?
                @unclaimed_contracts << contract 
            end
            @unclaimed_contracts
        end
    end

end


#link_to contract.monster.name, contract_path(contract) + " #{contract.location.name}" + " #{contract.reward}"

#"#{contract.monster.name}" + " #{contract.location.name}" + " #{contract.reward}"