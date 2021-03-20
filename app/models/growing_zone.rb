
class GrowingZone < ApplicationRecord
    has_many :gardens
    has_many :plants, through: :gardens
end

