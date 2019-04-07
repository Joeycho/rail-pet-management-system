class Pet < ApplicationRecord
    belongs_to :clinic
    belongs_to :owner

    validates :name, presence: true
    validates :breed, presence: true
    
end
