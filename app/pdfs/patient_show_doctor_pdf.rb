class PatientShowDoctorPdf < Prawn::Document
  def initialize(patient)
    @patient = patient
    
    super(top_margin: 50)
    patient_name
    general_data
  end
  
  def patient_name
    text "Patient name: #{@patient.last_name}", size: 20, style: :bold
  end
  
  def general_data
    #if @current_user.current_user.doctor_role
      #table admittance_data_rows
    #end
    table physicians_data_rows
    table general_data_rows
  end
  
  def general_data_rows
    move_down 20
    [["first name", "last name", "middle name", "birthday"]] +
    [[@patient.first_name, @patient.last_name, @patient.middle_name, @patient.birthday]]
  end
  
  def admittance_data_rows
    move_down 20
    [["admittance date", "admittance time", "admittance reason"]] +
    [[HelperDisplay.datetry(@patient.admittance), HelperDisplay.timetry(@patient.admittance), HelperDisplay.reasontry(@patient.admittance)]]
  end
  
  def physicians_data_rows
    move_down 20
    [["family physician", "physician phone"]] +
    [[HelperDisplay.fphysiciantry(@patient.physician), HelperDisplay.fp_phonetry(@patient.physician)]]
  end
end