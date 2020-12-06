module JobFacades
  class ShowFacade
    attr_reader :job

    def initialize(job)
      @job = job
    end
  end
end
