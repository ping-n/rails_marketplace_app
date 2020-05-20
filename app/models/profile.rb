class Profile < ApplicationRecord
  belongs_to :user
  # Setting up DB validation
  validates :first_name, presence: true, length: { minimum: 2,
                                                   maximum: 30,
                                                   too_short: 'Please ensure listing name is more than 2 characters',
                                                   too_long: 'Please ensure listing name is less than 30 characters' }
  validates :surname, presence: true, length: {
    minimum: 2,
    maximum: 30,
    too_short: 'Please ensure listing name is more than 2 characters',
    too_long: 'Please ensure listing name is less than 30 characters'
  }
end
