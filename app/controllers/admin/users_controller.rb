class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET admin/users
  def index
    @users = User.all
  end

  # GET admin/users/1
  def show
  end

  # GET admin/users/new
  def new
    authorize! :create, @user
    @user = User.new
  end

  # GET admin/users/1/edit
  def edit
  end

  # POST admin/users
  def create
    @user = User.new(user_params)
    authorize! :create, @user
    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_users_path, notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT admin/users/1
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to [:admin,@user], notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE admin/users/1
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_path, notice: 'User was successfully destroyed.' }
    end
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      User.unscoped {
        @user = User.find(params[:id])
      }
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin, :active, :avatar, :role)
    end

end
