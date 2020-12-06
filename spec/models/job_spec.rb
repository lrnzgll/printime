require 'rails_helper'

RSpec.describe Job, type: :model do
  describe 'Associations' do
    it { should belong_to(:user) }
    it { should have_many(:periods) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:title) }
  end

  describe "methods" do
    let(:user) { create(:user) }
    let(:job) { create(:job, user: user) }
    let!(:ended_period) { create(:period, :ended_period, job: job, user: user) }
    let!(:period) { create(:period, job: job, user: user) }
    it "#active_period" do
      expect(job.active_period).to eq(period)
    end

    it "#active?" do
      expect(job.active?).to eq(true)
    end
  end
end
