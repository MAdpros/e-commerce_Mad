module CurrentCart
  

    private

    def set_cart
        if user_signed_in?
        @cart = current_user.cart || current_user.create_cart
        session[:cart_id] ||= @cart.id
        else
        redirect_to new_user_session_path, notice: "vous devez vous connecter"
        end
        # @cart = Cart.find_by(id: session[:cart_id]) || Cart.create
        
    end
end