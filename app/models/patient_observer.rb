class PatientObserver < ActiveRecord::Observer
    observe :patient
    def after_create(patient)
    end
end

