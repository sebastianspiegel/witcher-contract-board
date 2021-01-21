module ContractsHelper


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

    def show_claimed_by
        if @contract.contract_is_claimed? 
            "Claimed by: #{WitchersContract.find_by(contract_id: @contract.id).user.name}"
        end
    end

    def show_claim_button
        #not working with form_for 
        if @user.witcher? && !@contract.contract_is_claimed?
            form_for(@contract) do |f|
                f.hidden_field :witcher_id 
                f.submit "Claim contract"
            end
        end
    end

    def show_edit_link
        if @user == @contract.user
            link_to 'Edit contract', edit_contract_path(@contract.id)
        end
    end

    def available_contracts
        @contracts.map do |contract|
            if !contract.contract_is_claimed?
                link_to contract.monster.name, contract_path(contract.id)
            end
        end
    end

end