class Bill < ApplicationRecord
    belongs_to :discharge
    has_many :charges, dependent: :destroy
    accepts_nested_attributes_for :charges
end
