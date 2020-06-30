class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :force_json, only: :search

  # GET /users
  def index
    @users = User.where(active: true).all
  end

  # GET /users/1
  def show
    @strive_categories = StriveCategory.order("name DESC").all
  end
  
# GET /users/search
  def search
    q = params[:q].downcase
    @users = User.where("lower(name) LIKE ?", "%#{q}%").where(active: true).limit(5)
  end


  private
    def set_user
      @user = User.where(active: true, id: params[:id]).first
    end
    
    def force_json
      request.format = :json
    end
end
