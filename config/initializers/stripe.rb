# frozen_string_literal: true
if Rails.env.production?
  Stripe.api_key = Rails.application.credentials[:stripe][:secret]
end
