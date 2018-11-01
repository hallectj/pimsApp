class Patient < ApplicationRecord
    
    has_one :physician, dependent: :destroy
    has_one :emergency_contact, dependent: :destroy
    has_one :contact, dependent: :destroy
    has_one :location, dependent: :destroy
    has_one :admittance, dependent: :destroy
    has_one :discharge, dependent: :destroy
    has_one :insurance, dependent: :destroy
    has_one :treatment, dependent: :destroy
    accepts_nested_attributes_for :physician, update_only: true
    accepts_nested_attributes_for :emergency_contact, update_only: true
    accepts_nested_attributes_for :contact
    accepts_nested_attributes_for :physician, update_only: true
    accepts_nested_attributes_for :location, update_only: true
    accepts_nested_attributes_for :admittance, update_only: true
    accepts_nested_attributes_for :insurance, update_only: true
    accepts_nested_attributes_for :discharge, update_only: true
    accepts_nested_attributes_for :treatment, update_only: true
  
    def build_a_admittance
       if admittance
           admittance
       else
           build_admittance
       end
    end
  
    def self.search(search)
      if search
        where('last_name LIKE ?', "%#{search}%").order('id DESC')
      else
        order('id DESC') 
      end
    end
    
    
end
