class ChargesController < ApplicationController
  include CurrentCart
  include CurrentDelivery

  def new
  end

  def create
    # Amount in cents
    @payed = current_user.cart.total + current_user.delivery.total

    @amount = @payed.to_i * 100

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: "payement de #{current_user.username}",
      currency: "eur",
    })

      current_user.cart.destroy
      current_user.delivery.destroy


  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
