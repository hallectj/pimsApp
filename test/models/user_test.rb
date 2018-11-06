require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "strong signup params " do
    u = User.new
    assert_not u.save
  end

  test "signup office user with valid params" do
    u = User.new(email: "office@example.com", password: "password", password_confirmation: "password", office_role: true)
    assert u.save
  end

  test "signup super user with valid params" do
    u = User.new(email: "test@example.com", password: "password", password_confirmation: "password", superadmin_role: true)
    assert u.save
  end

  test "signup volunteer user with valid params" do
    u = User.new(email: "vol@example.com", password: "password", password_confirmation: "password", volunteer_role: true)
    assert u.save
  end

  test "signup medical user with valid params" do
    u = User.new(email: "med@example.com", password: "password", password_confirmation: "password", medical_role: true)
    assert u.save
  end

  test "signup doctor user with valid params" do
    y = User.new(email: "doctor@example.com", password: "password", password_confirmation: "password", doctor_role: true)
    assert y.save
  end

end
