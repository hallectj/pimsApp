require 'test_helper'

class DischargeTest < ActiveSupport::TestCase
  test "Discharge can be created from patient" do
    #patient = Patient.new
    discharge = Discharge.new
    assert discharge.save
  # test "the truth" do
  #   assert true
  # end
  end
end
