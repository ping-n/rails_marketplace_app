class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :category
  enum condition: { 'Brand New': 0, 'Used': 1 }
  has_one_attached :picture
  has_many :listing_carts
  has_many :cart, through: :listing_carts
end
