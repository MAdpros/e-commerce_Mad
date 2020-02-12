module CurrentDelivery
  
  private

    def set_delivery
        if user_signed_in?
        @delivery = current_user.delivery || current_user.create_delivery
        session[:delivery_id] ||= @delivery.id
        else
        redirect_to new_user_session_path, notice: "vous devez vous connecter"
        end
        # @delivery = delivery.find_by(id: session[:delivery_id]) || delivery.create
        
    end
end