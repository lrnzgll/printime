class Period < ApplicationRecord
  belongs_to :job
  belongs_to :user

  validates :start_time, presence: true

  validates_with SavePeriodValidator, on: :create

  validates_with StopPeriodValidator, on: :stop

  scope :active, -> { where.not(start_time: nil).where(end_time: nil) }

  def stop
    update(end_time: Time.zone.now)
  end
end
