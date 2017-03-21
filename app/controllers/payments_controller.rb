class PaymentsController < ApplicationController
  before_action :authenticate_user!

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

      if charge.paid
        Order.create(
          product_id: @product.id,
          user_id: @user.id,
          total: @product.price_in_cents
        )

        # UserMailer.order_recieved(@user).deliver_now

      end

    rescue Stripe::CardError => e
      # the card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end

    redirect_to paymenst_create_path

  end
end
