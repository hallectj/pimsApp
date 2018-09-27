class Treatment < ApplicationRecord
    belongs_to :patient
    has_many :prescriptions, dependent: :destroy
    has_many :schedules, dependent: :destroy
    has_many :dr_notes, dependent: :destroy
    has_many :n_notes, dependent: :destroy
end
