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

    def monster_form_fields(f)
        if @monster   # params[:brand_id]
            f.hidden_field :monster_id, value: @monster.id 
        else 
            render partial: "monster_fields", locals: { f: f } 
        end 
   end

   def location_form_fields(f)
        if @location
            f.hidden_field :location_id, value: @location.id
        else
            render partial: "location_fields", locals: { f: f }
        end
    end

end


#link_to contract.monster.name, contract_path(contract) + " #{contract.location.name}" + " #{contract.reward}"

#"#{contract.monster.name}" + " #{contract.location.name}" + " #{contract.reward}"