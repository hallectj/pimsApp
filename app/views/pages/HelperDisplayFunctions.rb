require 'date'
require 'time'

module HelperDisplay 

    def self.datetry(input)
        if (input == nil)
            d = Date.new(0001, 01, 1)
            return d
        else 
            return input.date
        end
    end

    def self.timetry(input)
        if(input == nil)
            d = Time.new(01, 01, 01, 01)
            return d.strftime("%H:%M:%S")
        else
            return input.time.strftime("%H:%M:%S")
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
end