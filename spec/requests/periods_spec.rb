require 'rails_helper'

RSpec.describe "Jobs", type: :request do
  describe 'GET /periods' do
    context 'not authenticated' do
      include_examples "authenticated", :periods
    end
  end
  describe "POST /jobs/:id/periods" do
    context 'not authenticated' do
      let(:user) { create(:user) }
      let(:jj) { create(:job, user: user) }
      include_examples "authenticated", :job_periods, :post
    end
    context 'authenticated' do
      let(:user) { create(:user) }
      let(:job) { create(:job, user: user) }

      it 'creates a new period' do
        post job_periods_path(job)
      end
    end
  end

  describe "PATCH stop" do
    xit "stop" do

    end
  end

  describe "POST create" do
    xit "save" do

    end
  end
end
