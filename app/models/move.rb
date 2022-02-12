class Move < ApplicationRecord
    belongs_to :generation
    belongs_to :type
end
