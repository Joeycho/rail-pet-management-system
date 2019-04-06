class Owner < ApplicationRecord
    has_many :pets
    has_many :clinics, through: :pets

    validates :name, presence: true
    validates_format_of :name, :with => /\A([a-z\s])+\Z/i
    validates :email, uniqueness: true
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  #  validates :password, presence: true

    has_secure_password

end
