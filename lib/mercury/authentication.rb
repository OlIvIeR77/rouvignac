module Mercury
  module Authentication

    def can_edit?
      	if admin_signed_in? 
      		true
      	end
    end

  end
end
