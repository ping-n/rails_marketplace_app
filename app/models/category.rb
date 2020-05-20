class Category < ApplicationRecord
  has_many :listings
  # validates DB
  validates :name, presence: true
end
