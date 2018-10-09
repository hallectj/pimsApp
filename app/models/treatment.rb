class Treatment < ApplicationRecord
    belongs_to :patient
    has_many :prescriptions, class_name: "Prescription",
        foreign_key: "treatment_id", dependent: :destroy
    has_many :schedules, class_name: "Schedule",
        foreign_key: "treatment_id", dependent: :destroy
    has_many :dr_notes, class_name: "DrNote",
        foreign_key: "treatment_id", dependent: :destroy
    has_many :n_notes, class_name: "NNote",
        foreign_key: "treatment_id", dependent: :destroy
    accepts_nested_attributes_for :schedules
    accepts_nested_attributes_for :prescriptions
    accepts_nested_attributes_for :dr_notes
    accepts_nested_attributes_for :n_notes
end
