if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => ENV['pk_test_pZNQUMm3QZDMrrJn6T0RNEA4'],
    :secret_key => ENV['sk_test_ji1F0w0OLJwk2SW3PI6e2bJw']
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
