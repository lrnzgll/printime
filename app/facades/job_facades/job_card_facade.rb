module JobFacades
  class JobCardFacade
    attr_reader :job

    def initialize(job:)
      @job = job
    end

    def job_title
      job.title
    end

    def active_period
      @active_period ||= job.active_period
    end

    def active_job?
      job.active?
    end
  end
end
