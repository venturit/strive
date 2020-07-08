class BadgePolicy < ApplicationPolicy
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

  def initialize(user, scope)
    @user  = user
    @scope = scope
  end

  def allowed_badges

    if @user.role.blank? || @user.role == ENV['TEAMMATE_ID'].to_i 
      return @scope.where(id: ENV['BRONZE_ID'].to_i).all
    else
      return @scope
    end
    
  end
end
