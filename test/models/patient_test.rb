require 'test_helper'

class PatientTest < ActiveSupport::TestCase

  test "should not save patient without name patient" do
    patient = Patient.new
    assert patient.save
  end
end