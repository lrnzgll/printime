class PeriodPolicy < ApplicationPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.where(user: user)
    end
  end

  attr_reader :user, :period

  def initialize(user, period)
    @period = period
    @user = user
  end

  def create?
    user.user.id == period.user_id && user.user.id == user.job.user_id
  end

  def stop?
    user.user.id == period.user_id && user.user.id == user.job.user_id
  end
end
