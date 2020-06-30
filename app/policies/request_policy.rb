class RequestPolicy < ApplicationPolicy

  def initialize(user, scope)
    @user = user
    @scope = scope
  end

  class Scope < Scope
    
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if scope.requestor_id == user.id || user.admin?
        scope
      end
      # TODO: filter scope by requester
    end

    private
    attr_reader :user, :scope
  end

  def index?
    @user.active?
   end
 
   def show?
    @user.active?
   end
 
   def create?
    @user.active?
   end
 
   def new?
    @user.active?
   end
 
   def update?
     @scope.requestor_id == @user.id || @user.admin?
   end
 
   def edit?
     update?
   end
 
   def destroy?
      update?
   end

   def approve?
    @scope.requestee_id == @user.id
   end




end
