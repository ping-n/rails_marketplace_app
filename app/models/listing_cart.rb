class ListingCart < ApplicationRecord
  belongs_to :cart
  belongs_to :listing
end
