require 'rails_helper'

RSpec.describe Period, type: :model do
  describe "Associations" do
    it { should belong_to(:job) }
    it { should belong_to(:user) }
  end
end
