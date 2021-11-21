#Rails.configuration.stripe = {
#  :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
#  :secret_key      => ENV['STRIPE_SECRET_KEY']
#}

#Stripe.api_key = Rails.configuration.stripe[:secret_key]

Rails.configuration.stripe = {
  :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
  :secret_key      => ENV['STRIPE_SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
#Stripe.api_key = "pk_test_51Jhv1dICCug90syhKXKMnG1QVftG0G3D8QzFECpjxdLxma1Grto2BJGF892b96aZMecICCD94Fsww62xqHUOkL7t00IKIenqJG"
