class Listing < ApplicationRecord
  belongs_to :user
  enum condition: { brand_new: 0, used: 1 }
  has_one_attached :picture
  has_many :shoppingcarts, dependent: :destroy
  has_many :categories, dependent: :destroy
end
