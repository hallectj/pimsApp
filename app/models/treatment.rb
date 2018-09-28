class Treatment < ApplicationRecord
    belongs_to :patient
    has_many :prescriptions, dependent: :destroy
    has_many :schedules, dependent: :destroy
    has_many :dr_notes, dependent: :destroy
    has_many :n_notes, dependent: :destroy
    accepts_nested_attributes_for :schedules
    accepts_nested_attributes_for :prescriptions
    accepts_nested_attributes_for :dr_notes
    accepts_nested_attributes_for :n_notes
<<<<<<< HEAD

=======
>>>>>>> d92f284916a7369cb6365a7c4ac267f09bb23a14
end
