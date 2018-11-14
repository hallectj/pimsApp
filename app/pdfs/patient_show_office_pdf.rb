class PatientShowOfficePdf < Prawn::Document
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
      #table contact_data_rows
    end

    def general_data_rows
        move_down 20
        text "General Data:", size: 16, style: :bold
        [["first name", "last name", "middle name", "birthday"]] +
        [[@patient.first_name, @patient.last_name, @patient.middle_name, @patient.birthday]]
    end

    
    


end