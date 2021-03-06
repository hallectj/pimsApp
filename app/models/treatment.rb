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
end
