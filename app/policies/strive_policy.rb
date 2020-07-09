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

    def resolve_period
   
      strive_given = Strive.where(awarder_id: scope.awarder_id, awardee_id: scope.awardee_id, strive_category_id: scope.strive_category_id).where(created_at: ENV['STRIVE_PERIOD'].to_i.days.ago..1.days.from_now).all()
      
      if strive_given.size > 0
        scope.errors.add(:reason, "Oh Snap! You have already awarded a similar strive in the last two weeks.")
        return scope
      else
        return scope
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
    if User::ROLES[@user.role_id].eql?('teammate')
      @scope.where(name: ["Bronze"]).all
    else
      @scope
    end
    
  end
end
