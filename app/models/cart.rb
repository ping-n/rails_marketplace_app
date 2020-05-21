class Cart < ApplicationRecord
  belongs_to :user
  has_many :listing_carts
  has_many :listings, through: :listing_carts, dependent: :destroy
end
