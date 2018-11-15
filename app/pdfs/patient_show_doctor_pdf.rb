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
       move_down 5
       text "Treating for #{HelperDisplay.treatmenttry(@patient.treatment)}", size: 16, style: :bold 

       move_down 20
       text "Prescriptions Information on Patient", size: 16, style: :bold
       @patient.treatment.prescriptions.each do |p|
         data = [
           [{content: "prescription name "}, {:content => "#{HelperDisplay.pres_nametry(p)}"}],
           [{content: "amount prescribed "}, {:content => "#{HelperDisplay.pres_amounttry(p)}"}],
           [{content: "prescription schedule "}, {:content => "#{HelperDisplay.pres_scheduletry(p)}"}]
         ]

         table(data, :cell_style => {:border_width => 0, :padding_left => 5, :padding_bottom => 0})
         move_down 4 
         custom_horizontal_rule(8, 532)             
       end
       
       move_down 20
       text "Schedule Information on Patient", size: 16, style: :bold       
       @patient.treatment.schedules.each do |s|
         data = [
           [{content: "date and time "}, {:content => "#{(HelperDisplay.schedule_datetry(s)).strftime("%Y-%m-%d")}  #{HelperDisplay.schedule_timetry(s)}"}],
           [{content: "schedule message "}, {:content => HelperDisplay.schedule_msgtry(s)}] 
         ]
         table(data, :cell_style => {:border_width => 0})
         move_down 4
         stroke_horizontal_rule
       end

       move_down 20
       text "Doctor Notes Conerning the Patient", size: 16, style: :bold       
       @patient.treatment.dr_notes.each do |s|
         data = [
           [{content: "name "}, {:content => "#{(HelperDisplay.drnote_nametry(s))}"}],
           [{content: "message "}, {:content => HelperDisplay.drnote_msgtry(s)}] 
         ]
         table(data, :cell_style => {:border_width => 0})
         move_down 4
         custom_horizontal_rule(8, 532)
       end
    end
  end

  

  private 
  def custom_horizontal_rule(boundLeft, boundRight)
    stroke do 
      dash(4, space: 2, phase: 0)
      line_width 2
      horizontal_line(boundLeft, boundRight)
    end
  end

end