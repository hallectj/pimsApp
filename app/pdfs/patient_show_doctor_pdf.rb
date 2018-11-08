class PatientShowDoctorPdf < Prawn::Document
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
    table contact_data_rows
    table physicians_data_rows
    table emergency_contact_data_rows
    table phone_data_rows
    table location_data_rows
    table admittance_rows
    table discharge_rows
    detailed_report
  end
  
  def general_data_rows
    move_down 20
    text "General Data:", size: 16, style: :bold
    [["first name", "last name", "middle name", "birthday"]] +
    [[@patient.first_name, @patient.last_name, @patient.middle_name, @patient.birthday]]
  end
  
  def admittance_data_rows
    move_down 60
    text "Admittance Data:", size: 16, style: :bold
    [["admittance date", "admittance time", "admittance reason"]] +
    [[HelperDisplay.datetry(@patient.admittance), HelperDisplay.timetry(@patient.admittance), HelperDisplay.reasontry(@patient.admittance)]]
  end
  
  def physicians_data_rows
    move_down 20
    text "Family Physician:", size: 16, style: :bold
    [["family physician", "physician phone"]] +
    [[HelperDisplay.fphysiciantry(@patient.physician), HelperDisplay.fp_phonetry(@patient.physician)]]
  end

  def emergency_contact_data_rows
    move_down 20
    text "Emergency Contacts:", size: 16, style: :bold
    [["contact 1 name", "contact 1 phone"], [HelperDisplay.e1_try(@patient.emergency_contact), HelperDisplay.e1p_try(@patient.emergency_contact)]] + 
    [["contact 2 name", "contact 2 phone"], [HelperDisplay.e2_try(@patient.emergency_contact), HelperDisplay.e2p_try(@patient.emergency_contact)]]
  end

  def contact_data_rows
    move_down 20
    text "Address Information:", size: 16, style: :bold
    [["street", "city", "state", "zip"]] + 
    [[HelperDisplay.streettry(@patient.contact), HelperDisplay.citytry(@patient.contact), HelperDisplay.statetry(@patient.contact), HelperDisplay.ziptry(@patient.contact)]]
  end

  def phone_data_rows
    move_down 20
    text "Phone Information on Patient", size: 16, style: :bold
    [["home phone", "mobile phone", "work phone"]] + [[HelperDisplay.hometry(@patient.contact), HelperDisplay.mobiletry(@patient.contact), HelperDisplay.worktry(@patient.contact)]]
  end

  def location_data_rows
    move_down 20
    text "Location Information on Patient", size: 16, style: :bold 
    [["facility", "room number", "bed number", "approved visitors"]] + 
    [[HelperDisplay.facilitytry(@patient.location), HelperDisplay.roomtry(@patient.location), HelperDisplay.bedtry(@patient.location), HelperDisplay.vlimittry(@patient.location)]]
  end

  def admittance_rows
    move_down 20
    text "Admittance Information on Patient", size: 16, style: :bold 
    [["date", "time", "reason"]] + 
    [[HelperDisplay.datetry(@patient.admittance), HelperDisplay.timetry(@patient.admittance), HelperDisplay.reasontry(@patient.admittance)]]
  end

  def discharge_rows
    move_down 20
    text "Discharge Information on Patient", size: 16, style: :bold
    [["date", "time"]] + 
    [[HelperDisplay.datetry(@patient.discharge), HelperDisplay.timetry(@patient.discharge)]]
  end

  def detailed_report
    move_down 20
    bounding_box([0, cursor], width: 540, height: cursor) do
       stroke_bounds
       move_down 20
       text "Prescriptions, Schedules and Doctor Notes", size: 16, style: :bold 
       
       #stuff goes here
    end
  end

end