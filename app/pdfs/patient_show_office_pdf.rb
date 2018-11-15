class PatientShowOfficePdf < Prawn::Document
    def initialize(patient, discharge)
      @patient = patient
      @discharge = discharge
      
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
      table emergency_contact_data_rows
      table phone_data_rows
      table location_data_rows
      table admittance_rows
      table insurance_rows
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
    
    def insurance_rows
      move_down 20
      text "Insurance Information on Patient", size: 16, style: :bold 

      [["policy number", "policy name", "group number"]] + 
      [[HelperDisplay.p_numtry(@patient.insurance), HelperDisplay.p_nametry(@patient.insurance), HelperDisplay.grouptry(@patient.insurance)]]
    end



    def detailed_report
      if (!@patient.discharge.nil?)
        move_down 20
        text "Discharge Information", size: 16, style: :bold 
        text "Discharge date #{HelperDisplay.datetry(@patient.discharge)}  Discharge time #{HelperDisplay.timetry(@patient.discharge)}"
  
        move_down 10
        text "Billing Information", size: 16, style: :bold 
        if (!@patient.discharge.bill.nil?)
          text "Amount Paid  #{HelperDisplay.amount_paid_try(@patient.discharge.bill)}" 
          text "Amount Owed #{HelperDisplay.amount_owed_try(@patient.discharge.bill)}"
          text "Amount Insurance Owes #{HelperDisplay.amount_insurance_try(@patient.discharge.bill)}"
       
          move_down 20
          text "Itemized Charges for Patient Care", size: 16, style: :bold

          @patient.discharge.bill.charges.each do |c|
            data = [
              [{content: "Charge Name "}, {:content => "#{HelperDisplay.charge_name_try(c)}"}],
              [{content: "Charge Amount "}, {:content => "#{HelperDisplay.charge_amount_try(c)}"}],
            ]
  
            table(data, :cell_style => {:border_width => 0, :padding_left => 5, :padding_bottom => 0})
            move_down 4 
            custom_horizontal_rule(8, 532)             
          end
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