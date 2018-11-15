class Admittance < ApplicationRecord
    #validates: time:, presence: true
    belongs_to :patient
end
