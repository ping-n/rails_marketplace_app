class Profile < ApplicationRecord
  belongs_to :user
  # Setting up DB validation
  validates :first_name, presence: true, length: { minimum: 2,
                                                   maximum: 30,
                                                   too_short: 'Please ensure name is more than 2 characters',
                                                   too_long: 'Please ensure name is less than 30 characters' }
  validates :surname, presence: true, length: {
    minimum: 2,
    maximum: 30,
    too_short: 'Please ensure  surname is more than 2 characters',
    too_long: 'Please ensure surname is less than 30 characters'
  }
  validates :location, presence: true, length: {
    minimum: 2,
    maximum: 30,
    too_short: 'Please ensure location is more than 2 characters',
    too_long: 'Please ensure location is less than 30 characters'
  }
end
