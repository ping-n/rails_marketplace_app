class Listing < ApplicationRecord
  belongs_to :user
  has_many :shoppingcarts, dependent: :destroy
end
