class Bill < ApplicationRecord
    belongs_to :discharge
    has_many :charges, dependent: :destroy
end
