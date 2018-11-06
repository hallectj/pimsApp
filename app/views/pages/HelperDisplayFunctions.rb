require 'date'
require 'time'
require 'bigdecimal'

module HelperDisplay 
    def self.datetry(input)
        if (input.try(:date))
            return input.date
        else 
            d = Date.new(0001, 01, 1)
            return d
        end
    end

    def self.timetry(input)
        if (input.try(:time))
            return input.time.to_s(:time) 
        else
            d = Time.new(01, 01, 01, 01)
            return d.strftime("%H:%M %p")
        end
    end

    def self.try(input)
        if (input != nil) 
            return input.name 
        else  
            a = String.new("None")
            return a
        end
    end
    
    def self.amount_paid_try(input)
        if (input != nil) 
            return input.amount_paid
        else  
            a = BigDecimal.new("0")
            return a
        end
    end
    
    def self.amount_owed_try(input)
        if (input != nil) 
            return input.amount_owed
        else  
            a = BigDecimal.new("0")
            return a
        end
    end
    
    def self.amount_insurance_try(input)
        if (input != nil) 
            return input.amount_insurance
        else  
            a = BigDecimal.new("0")
            return a
        end
    end

    def self.facilitytry(input)
        if (input != nil) 
            return input.facility 
        else  
            a = String.new("None")
            return a
        end
    end

    def self.roomtry(input)
        if (input != nil) 
            return input.room 
        else  
            a = String.new("None")
            return a
        end
    end  
    
    def self.bedtry(input)
        if (input != nil) 
            return input.bed
        else  
            a = String.new("None")
            return a
        end
    end

    def self.treatmenttry(input)
        if (input != nil) 
            return input.name 
        else  
            a = String.new("None")
            return a
        end
    end
    
    def self.fphysiciantry(input)
        if (input != nil) 
            return input.family_physician 
        else  
            a = String.new("None")
            return a
        end
    end 
    
    def self.fp_phonetry(input)
        if (input != nil) 
            return input.physician_phone 
        else  
            a = String.new("None")
            return a
        end
    end
    
    def self.nametry(input)
        if (input != nil) 
            return input
        else  
            a = String.new("None")
            return a
        end
    end    
    
    def self.reasontry(input)
        if (input != nil)
            return input.reason
        else
            a = String.new("None")
            return a
        end
    end 

    def self.hometry(input)
        if (input != nil)
            return input.home_phone
        else
            a = String.new("None")
            return a
        end
    end

    def self.mobiletry(input)
        if (input != nil)
            return input.mobile_phone
        else
            a = String.new("None")
            return a
        end
    end

    def self.worktry(input)
        if (input != nil)
            return input.work_phone
        else
            a = String.new("None")
            return a
        end
    end

    def self.streettry(input)
        if (input != nil)
            return input.street
        else
            a = String.new("None")
            return a
        end
    end

    def self.citytry(input)
        if (input != nil)
            return input.city
        else
            a = String.new("None")
            return a
        end
    end

    def self.statetry(input)
        if (input != nil)
            return input.state
        else
            a = String.new("None")
            return a
        end
    end

    def self.ziptry(input)
        if (input != nil)
            return input.zip
        else
            a = String.new("None")
            return a
        end
    end

    def self.firsttry(input)
        if (input != nil)
            return input.first_name
        else
            a = String.new("None")
            return a
        end
    end

    def self.lasttry(input)
        if (input != nil)
            return input.last_name
        else
            a = String.new("None")
            return a
        end
    end

    def self.middletry(input)
        if (input != nil)
            return input.middle_name
        else
            a = String.new("None")
            return a
        end
    end

    def self.birthdaytry(input)
        if (input != nil)
            return input.birthday
        else
            a = String.new("None")
            return a
        end
    end

    def self.p_numtry(input)
        if (input != nil)
            return input.policy_num
        else
            a = String.new("None")
            return a
        end
    end

    def self.p_nametry(input)
        if (input != nil)
            return input.policy_name
        else
            a = String.new("None")
            return a
        end
    end

    def self.grouptry(input)
        if (input != nil)
            return input.group_num
        else
            a = String.new("None")
            return a
        end
    end

    def self.e1_try(input)
        if (input != nil)
            return input.e1_name
        else
            a = String.new("None")
            return a
        end
    end

    def self.e2_try(input)
        if (input != nil)
            return input.e2_name
        else
            a = String.new("None")
            return a
        end
    end

    def self.e1p_try(input)
        if (input != nil)
            return input.e1_phone
        else
            a = String.new("None")
            return a
        end
    end

    def self.e2p_try(input)
        if (input != nil)
            return input.e2_phone
        else
            a = String.new("None")
            return a
        end
    end

    def self.vlimittry(input)
        if (input != nil)
            return input.visitor_limit
        else
            a = String.new("None")
            return a
        end
    end

    def self.vapprovedtry(input)
        if (input != nil)
            return input.approved_visitors
        else
            a = String.new("None")
            return a
        end
    end

    def self.pres_nametry(input)
        if (input != nil)
            return input.name
        else
            a = String.new("None")
            return a
        end
    end

    def self.pres_amounttry(input)
        if (input != nil)
            return input.amount
        else
            a = String.new("None")
            return a
        end
    end

    def self.pres_scheduletry(input)
        if (input != nil)
            return input.schedule
        else
            a = String.new("None")
            return a
        end
    end

    def self.schedule_datetry(input)
        if (input != nil)
            return input.date
        else
            a = String.new("None")
            return a
        end
    end

    def self.schedule_timetry(input)
        if (input != nil)
            return input.time.to_s(:time) 
        else
            a = String.new("None")
            return a
        end
    end

    def self.schedule_msgtry(input)
        if (input != nil)
            return input.schedule_msg
        else
            a = String.new("None")
            return a
        end
    end

    def self.drnote_nametry(input)
        if (input != nil)
            return input.name
        else
            a = String.new("None")
            return a
        end
    end

    def self.drnote_msgtry(input)
        if (input != nil)
            return input.message
        else
            a = String.new("None")
            return a
        end
    end

    def self.nnote_nametry(input)
        if (input != nil)
            return input.name
        else
            a = String.new("None")
            return a
        end
    end

    def self.nnote_msgtry(input)
        if (input != nil)
            return input.message
        else
            a = String.new("None")
            return a
        end
    end

end