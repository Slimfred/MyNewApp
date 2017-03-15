class PaymentsController < ApplicationController


  def create
    token = params[:stripeToken]

    @product = Product.find (params[:product_id])

    @user = current_user

    #create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        :amount => (@product.price_in_cents),
        :currency => "usd",
        :source => token,
        :description => params[:stripeEmail]
      )
    rescue Stripe::CardError => e
      # the card has been declined
    end

    redirect_to payments_create_path

  end
end
