class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:webhook]

  def stripe_id
    @listing = current_user.cart
    items = []
    @listing.listings.each do |item|
      items << {
        name: item.name,
        description: item.description,
        amount: item.price.to_i * 100,
        currency: 'aud',
        quantity: 1
      }
    end
    session_id = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: current_user.email,
      line_items: items,
      payment_intent_data: {
        metadata: {
          user_id: current_user.id,
          listing_id: @listing.id
        }
      },
      success_url: "#{root_url}payments/success?userId=#{current_user.id}&listingId=#{@listing.id}",
      cancel_url: "#{root_url}listings"
    ).id
    render json: { id: session_id, stripe_public_key: Rails.application.credentials.dig(:stripe, :public_key) }
  end

  def success
    render payments_success_path
  end

  def webhook
    # payment_id = params[:data][:object][:payment_intent]
    # payment = Stripe::PaymentIntent.retrieve(payment_id)
    # listing_id = payment.metadata.listing_id
    # user_id = payment.metadata.user_id
    # listing = Listing.find(listing_id)
    # listing.sold = true
    # listing.save

    # # 'listing id ' + listing_id
    # # 'user id ' + user_id

    # head 200
  end
end
