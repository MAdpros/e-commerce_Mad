class ChargesController < ApplicationController
    include CurrentCart

    def new
    end

    def create
      
      @payed = current_user.cart.total
      # Amount in cents
      @amount =@payed.to_i

      customer = Stripe::Customer.create({
        email: params[:stripeEmail],
        source: params[:stripeToken],
      })

      charge = Stripe::Charge.create({
        customer: customer.id,
        amount: @amount,
        description: 'Rails Stripe customer',
        currency: 'usd',
      })

        current_user.cart.destroy

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end
end
