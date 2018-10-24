class PatientObserver < ActiveRecord::Observer
    observe :patient
    def after_create(patient)
        Physician.create! :patient_id => patient.id
        Discharge.create! :patient_id => patient.id
        EmergencyContact.create! :patient_id => patient.id
        Contact.create! :patient_id => patient.id
        Location.create! :patient_id => patient.id
        Admittance.create! :patient_id => patient.id
        Insurance.create! :patient_id => patient.id
    end
end

