class Discharge < ApplicationRecord
    belongs_to :patient
    has_one :bill, dependent: :destroy
    accepts_nested_attributes_for :bill
end
