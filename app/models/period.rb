class Period < ApplicationRecord
  belongs_to :job

  validates_with PeriodValidator
end
