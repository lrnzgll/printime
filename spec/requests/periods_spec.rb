require 'rails_helper'

RSpec.describe "Jobs", type: :request do
  describe "POST /periods" do
    context 'not authenticated' do
      include_examples "authenticated", :periods
    end
    context 'authenticated' do
      let(:user) { create(:user) }
      let(:job) { create(:job, user: user) }

      it 'creates a new period' do
        post periods_path(@job)
      end
    end
  end
end
