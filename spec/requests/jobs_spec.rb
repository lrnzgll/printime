require 'rails_helper'

RSpec.describe "Jobs", type: :request do
  describe "GET /jobs" do
    context 'not authenticated' do
      include_examples "authenticated", :jobs
    end
    context 'authenticated' do
      let(:user) { create(:user) }
      before do
        sign_in user
      end
      it "render jobs_path" do
        get jobs_path
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "GET new_job_path" do
    context 'not authenticated' do
      include_examples "authenticated", :new_job
    end
    context 'authenticated' do
      let(:user) { create(:user) }
      before do
        sign_in user
      end
      it 'renders new_job_path' do
        get new_job_path
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "POST jobs_path" do
    context 'not authenticated' do
      include_examples "authenticated", :jobs, :post
    end
    context 'authenticated' do
      let(:user) { create(:user) }
      let(:job) { build(:job, user: user) }
      before do
        sign_in user
      end
      it 'creates a new job and redirects to jobs_path' do
        post jobs_path, params: { job: { title: job.title, user_id: job.user.id } }
        expect(user.jobs.count).to eq(1)
        expect(response).to have_http_status(302)
      end
    end
  end

  describe "GET edit_job_path" do
    context 'not_authenticated' do
      include_examples "authenticated", :edit_job do
        let(:user) { create(:user) }
        let!(:obj) { create(:job, user: user) }
      end
    end
    context 'authenticated' do
      let(:user) { create(:user) }
      let(:job) { create(:job, user: user) }
      before do
        sign_in user
      end
    end
  end

  describe "GET job_path" do
    context 'not authenticated' do
      include_examples "authenticated", :job do
        let(:obj) { create(:job, user: create(:user)) }
      end
    end
    context 'authenticated' do
      let(:user) { create(:user) }
      let(:job) { create(:job, user: user) }
      before do
        sign_in user
      end
      it 'renders job_path' do
        get job_path(job)
        expect(response).to have_http_status(200)
      end
    end
  end
end
