module JobFacades
  class IndexFacade
    attr_reader :jobs

    def initialize(team_member:)
      @jobs = team_member.jobs.order(updated_at: :desc).decorate
    end

    def job_card_facades
      jobs.map do |job|
        JobFacades::JobCardFacade.new(job: job)
      end
    end
  end
end
