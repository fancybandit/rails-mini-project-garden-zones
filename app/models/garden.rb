
class Garden < ApplicationRecord
  belongs_to :plant
  belongs_to :growing_zone
end

