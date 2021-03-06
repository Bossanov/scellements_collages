# frozen_string_literal: true

require 'stripe'
require 'sinatra'
require 'dotenv'

# Replace if using a different env file or config
Dotenv.load
Stripe.api_key = ENV['STRIPE_SECRET_KEY']

set :static, true
set :public_folder, File.join(File.dirname(__FILE__), ENV['STATIC_DIR'])
set :port, 4242

get '/' do
  content_type 'text/html'
  send_file File.join(settings.public_folder, 'index.html')
end

get '/config' do
  content_type 'application/json'

  plan = Stripe::Plan.retrieve(ENV['SUBSCRIPTION_PLAN_ID'])

  {
    'publishableKey': ENV['STRIPE_PUBLISHABLE_KEY'],
    'plan': plan
  }.to_json
end

post '/create-customer' do
  content_type 'application/json'
  data = JSON.parse request.body.read

  # Create a new customer object
  customer = Stripe::Customer.create(
    name: data['name'],
    email: data['email']
  )

  # Create a SetupIntent to set up our payment methods recurring usage
  setup_intent = Stripe::SetupIntent.create(
    payment_method_types: %w[card au_becs_debit],
    customer: customer.id
  )

  {
    'customer': customer,
    'setupIntent': setup_intent
  }.to_json
end

post '/subscription' do
  content_type 'application/json'
  data = JSON.parse request.body.read

  # Set the default payment method on the customer
  Stripe::Customer.update(
    data['customerId'],
    invoice_settings: {
      default_payment_method: data['paymentMethodId']
    }
  )

  # Create the subscription
  subscription = Stripe::Subscription.create(
    customer: data['customerId'],
    items: [
      {
        plan: ENV['SUBSCRIPTION_PLAN_ID']
      }
    ],
    expand: ['latest_invoice.payment_intent']
  )

  subscription.to_json
end

post '/webhook' do
  # You can use webhooks to receive information about asynchronous payment events.
  # For more about our webhook events check out https://stripe.com/docs/webhooks.
  webhook_secret = ENV['STRIPE_WEBHOOK_SECRET']
  payload = request.body.read
  if !webhook_secret.empty?
    # Retrieve the event by verifying the signature using the raw body and secret if webhook signing is configured.
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    event = nil

    begin
      event = Stripe::Webhook.construct_event(
        payload, sig_header, webhook_secret
      )
    rescue JSON::ParserError => e
      # Invalid payload
      status 400
      return
    rescue Stripe::SignatureVerificationError => e
      # Invalid signature
      puts '??????  Webhook signature verification failed.'
      status 400
      return
    end
  else
    data = JSON.parse(payload, symbolize_names: true)
    event = Stripe::Event.construct_from(data)
  end
  # Get the type of webhook event sent - used to check the status of PaymentIntents.
  event_type = event['type']
  data = event['data']
  data_object = data['object']

  if event_type == 'customer.created'
    # puts data_object
  end

  if event_type == 'customer.updated'
    # puts data_object
  end

  if event_type == 'invoice.upcoming'
    # puts data_object
  end

  if event_type == 'invoice.created'
    # puts data_object
  end

  if event_type == 'invoice.finalized'
    # puts data_object
  end

  if event_type == 'invoice.payment_succeeded'
    # puts data_object
  end

  if event_type == 'invoice.payment_failed'
    # puts data_object
  end

  if event_type == 'customer.subscription.created'
    # puts data_object
  end

  content_type 'application/json'
  {
    status: 'success'
  }.to_json
end
