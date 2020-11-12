class PeriodsController < ApplicationController
  def index
    @periods = current_user.periods
    policy_scope(@periods)
  end
end
