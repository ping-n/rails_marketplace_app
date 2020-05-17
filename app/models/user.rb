class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum role: { user: 0, admin: 1 }
  after_initialize :set_default_role, if: :new_record?
  after_create :create_profile
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :listings, dependent: :destroy
  has_one :cart, dependent: :destroy
  has_one :profile, dependent: :destroy

  # Setting new user role to be user
  def set_default_role
    self.role ||= :user
  end

  def create_profile
    Profile.create(
      user: self,
      first_name: 'First Name',
      surname: 'Surname',
      location: 'Your Current Location'
    )
  end
end
