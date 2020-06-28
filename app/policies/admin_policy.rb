class AdminPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope
      else
        raise Pundit::NotAuthorizedError, 'not allowed to perfom this action'
      end
    end
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
