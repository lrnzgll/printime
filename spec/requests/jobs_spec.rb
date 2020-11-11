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
        expect(response).to redirect_to(job_path(user.jobs.last))
      end
    end
  end

  describe "GET edit_job_path" do
    context 'not_authenticated' do
      let(:user) { create(:user) }
      let(:jj) { create(:job, user: user) }
      it_behaves_like "authenticated", :edit_job
    end
    context 'authenticated' do
      let(:user) { create(:user) }
      let(:job) { create(:job, user: user) }
      before do
        sign_in user
      end
      it 'renders the edit page' do
        get edit_job_path(job)
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "PATCH job_path" do
    context 'not_authenticated' do
      let(:user) { create(:user) }
      let(:jj) { create(:job, user: user) }
      include_examples "authenticated", :job, :patch
    end
    context 'authenticated' do
      let(:user) { create(:user) }
      let(:job) { create(:job, user: user) }
      before do
        sign_in user
      end
      it 'update the job' do
        patch job_path(job), params: { job: { title: 'new title' } }

        expect(response).to have_http_status(302)
        expect(response).to redirect_to(job_path(job))
      end
    end
  end

  describe "GET job_path" do
    context 'not authenticated' do
      let(:user) { create(:user) }
      let(:jj) { create(:job, user: user) }
      include_examples "authenticated", :job
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
