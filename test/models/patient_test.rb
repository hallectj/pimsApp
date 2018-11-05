require 'test_helper'

class PatientTest < ActiveSupport::TestCase

  test "should not save patient without name patient" do
    patient = Patient.create(first_name: "this should fail")
    assert patient.save
  end
end