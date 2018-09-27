class Patient < ApplicationRecord
    has_one :physician
    has_one :emergency_contact
    has_one :contact
    has_one :location
    has_one :admittance
    has_one :discharge
    has_one :insurance
end
