class Period < ApplicationRecord
  belongs_to :job
  belongs_to :user

  validates_with PeriodValidator
end
