Rails.configuration.stripe = {
  :publishable_key => 'pk_test_w9kSoQBTxMrScmzumS5iiRxJ',
  :secret_key      => 'sk_test_cvCK3oQBzDh3XbXfyvoLZZCS'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]