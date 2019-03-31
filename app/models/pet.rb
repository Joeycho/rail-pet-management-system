class Pet < ApplicationRecord
    belongs_to :clinic
    belongs_to :owner
end
