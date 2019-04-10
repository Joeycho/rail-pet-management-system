class Clinic < ApplicationRecord
    has_many :pets
    has_many :owners, through: :pets

    validates :name, presence: true
    validates :addr, presence: true

    def self.available_clinic
      left_outer_joins(:pets).group('clinics.id').having('count(clinic_id) <5')
    end
    
end
