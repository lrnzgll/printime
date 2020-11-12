class Job < ApplicationRecord
  belongs_to :user
  has_many :periods, dependent: :destroy

  validates :title, presence: true
end
