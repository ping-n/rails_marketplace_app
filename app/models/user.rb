class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum role: { user: 0, admin: 1 }
  after_initialize :set_default_role, if: :new_record?
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :listings, dependent: :destroy
  has_one :cart, dependent: :destroy
  has_one :profile, dependent: :destroy

  # Setting new user role to be user
  def set_default_role
    self.role ||= :user
  end
end
