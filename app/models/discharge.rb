class Discharge < ApplicationRecord
    belongs_to :patient
    has_one :bill, dependent: :destroy
end
