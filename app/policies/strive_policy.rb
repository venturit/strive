class StrivePolicy < ApplicationPolicy
  class Scope < Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve_request
      if scope.requestee_id == user.id 
        return scope
      else
        raise Pundit::NotAuthorizedError, 'Oops! you cannot award a strive for this request'
      end

    end

    private
    attr_reader :user, :scope
  end
end
