class Patient < ApplicationRecord
    has_one :physician, dependent: :destroy
    has_one :emergency_contact, dependent: :destroy
    has_one :contact, dependent: :destroy
    has_one :location, dependent: :destroy
    has_one :admittance, dependent: :destroy
    has_one :discharge, dependent: :destroy
    has_one :insurance, dependent: :destroy
    has_one :treatment, dependent: :destroy
end
