class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :category
  enum condition: { 'Brand New': 0, 'Used': 1 }
  has_one_attached :picture
  has_many :listing_carts
  has_many :carts, through: :listing_carts

  # Setting up DB Validation
  validates :name, presence: true, length: { minimum: 2,
                                             maximum: 30,
                                             too_long: 'Please ensure listing name is less than 40 characters' }
  validates :brand, presence: true, length: { minimum: 2,
                                              maximum: 15,
                                              too_long: 'Please ensure listing brand is less than 40 characters' }
  validates :description, presence: true,
                          length: { maximum: 300,
                                    too_long: 'Please ensure listing name is less than 300 characters' }
  validates :price, presence: true
  validates :category, presence: true
  validates :picture, presence: { message: 'need to to included in listing' }
end
