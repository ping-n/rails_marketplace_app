class Listing < ApplicationRecord
  belongs_to :user
  has_one_attached :picture
  has_many :shoppingcarts, dependent: :destroy
  has_many :categories, dependent: :destroy
end
