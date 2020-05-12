class ListingsShoppingCart < ApplicationRecord
  belongs_to :listing
  belongs_to :shoppingcart
end
