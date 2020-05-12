class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :category
  enum condition: { brand_new: 0, used: 1 }
  has_one_attached :picture
  has_many :carts, dependent: :destroy
end
