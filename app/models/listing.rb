class Listing < ApplicationRecord
  belongs_to :user
  has_many :shoppingcarts, dependent: :destroy
  has_many :categories, dependent: :destroy
end
