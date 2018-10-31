require 'date'

class PatientObserver < ActiveRecord::Observer
    observe :patient
    def after_create(patient)
        d = DateTime.now()
        Admittance.create(patient_id: patient.id, date: d.strftime("%Y/%m/%d"), time: d.strftime("%I:%M%p"))
    end
end

