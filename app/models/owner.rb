class Owner < ApplicationRecord
    has_many :pets
    has_many :clinics, through :pets
end
