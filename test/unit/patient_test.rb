require 'test_helper'
class PatientTest < Test::Unit::TestCase

    def patient_create_test
        @patient = Patient.new   
        @patient.save
        assert true
    end
end
        