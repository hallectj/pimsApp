require 'test_helper'

class AdmittanceTest < ActiveSupport::TestCase
  test "Admittance can be created from patient" do
    #patient = Patient.new
    admittance = Admittance.new
    assert admittance.save
  # test "the truth" do
  #   assert true
  # end
  end
end
