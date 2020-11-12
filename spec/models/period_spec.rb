require 'rails_helper'

RSpec.describe Period, type: :model do
  describe "Associations" do
    it { should belong_to(:job) }
  end
end
