class PatientShowVolunteerPdf < Prawn::Document
    def initialize(patient)
      @patient = patient
      
      super(top_margin: 50)
      patient_name
      general_data
    end
    
    def patient_name
      text "Patient name: #{@patient.last_name}, #{@patient.first_name}", size: 20, style: :bold
    end
    
    def general_data
      table general_data_rows
      table emergency_contact_data_rows
      table location_data_rows
    end
    
    def general_data_rows
      move_down 20
      text "General Data:", size: 16, style: :bold
      [["first name", "last name", "middle name"]] +
      [[@patient.first_name, @patient.last_name, @patient.middle_name]]
    end
  
    def emergency_contact_data_rows
      move_down 20
      text "Emergency Contacts:", size: 16, style: :bold
      [["contact 1 name", "contact 1 phone"], [HelperDisplay.e1_try(@patient.emergency_contact), HelperDisplay.e1p_try(@patient.emergency_contact)]] + 
      [["contact 2 name", "contact 2 phone"], [HelperDisplay.e2_try(@patient.emergency_contact), HelperDisplay.e2p_try(@patient.emergency_contact)]]
    end
  
    def location_data_rows
      move_down 20
      text "Location Information on Patient", size: 16, style: :bold 
      [["facility", "room number", "bed number", "approved visitors"]] + 
      [[HelperDisplay.facilitytry(@patient.location), HelperDisplay.roomtry(@patient.location), HelperDisplay.bedtry(@patient.location), HelperDisplay.vlimittry(@patient.location)]]
    end
  
  end