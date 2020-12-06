class Job < ApplicationRecord
  belongs_to :user
  has_many :periods, dependent: :destroy

  validates :title, presence: true

  def active?
    periods.active.any?
  end

  def active_period
    periods.active.first
  end
end
