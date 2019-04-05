class Owner < ApplicationRecord
    has_many :pets
    has_many :clinics, through: :pets

    has_secure_password
end
