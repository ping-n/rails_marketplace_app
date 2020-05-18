class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:webhook]

  def stripe_id
    @listings = current_user.carts.last.listings
    items = @listings.map do |item|
      {
        name: item.name,
        description: item.description,
        amount: item.price.to_i * 100,
        currency: 'aud',
        quantity: 1
      }
    end
    listing_ids = @listings.pluck(:id).join(',')
    session_id = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: current_user.email,
      line_items: items,
      payment_intent_data: {
        metadata: {
          user_id: current_user.id,
          listing_ids: listing_ids
        }
      },
      success_url: "#{root_url}payments/success?userId=#{current_user.id}&listingIds=#{listing_ids}",
      cancel_url: "#{root_url}listings"
    ).id

    # rendering api key to when back?
    render json: { id: session_id, stripe_public_key: Rails.application.credentials.dig(:stripe, :public_key) }
  end

  def success
    @listings = current_user.carts.last.listings
    render payments_success_path
  end

  def webhook
    payment_id = params[:data][:object][:payment_intent]
    payment = Stripe::PaymentIntent.retrieve(payment_id)
    listing_id = payment.metadata.listing_id.split(',')
    listing_id.each do |id|
      listing = Listing.find(id)
      listing.sold = true
      listing.save
    end
    user = User.find(payment.metadata.user_id)
    cart = user.carts.last
    cart.completed = true
    cart.save

    head 200
  end
end
