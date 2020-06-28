class UserPolicy < ApplicationPolicy
  class Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      # filter by user scope or rule here
      @scope
    end

    private
    attr_reader :user, :scope
  end

  def index?
   @user.admin?
  end

  def show?
    index?
  end

  def create?
    @user.admin?
  end

  def new?
    create?
  end

  def update?
    @user.admin?
  end

  def edit?
    update?
  end

  def destroy?
    @user.admin?
  end



end
