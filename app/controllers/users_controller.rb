class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :force_json, only: :search

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
  end
  
# GET /users/search
  def search
    q = params[:q].downcase
    @users = User.where("lower(name) LIKE ?", "%#{q}%").limit(5)
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
    
    def force_json
      request.format = :json
    end
end
