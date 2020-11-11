class JobPolicy < ApplicationPolicy
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
  attr_reader :user, :job

  def initialize(user, job)
    @user = user
    @job = job
  end

  def new?
    true
  end

  def create?
    user.id == job.user_id
  end

  def show?
    user.id == job.user_id
  end

  def edit?
    user.id == job.user_id
  end

  def update?
    user.id == job.user_id
  end

  def destroy_intention?
    user.id == job.user_id
  end

  def destroy?
    user.id == job.user_id
  end
end
