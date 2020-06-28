class Admin::BadgesController < Admin::BaseController
  before_action :set_badge, only: [:show,  :edit, :update, :destroy]
  
  # GET /admin/badges/new
  def new
    @badge = Badge.new
  end
 
  # POST admin/badges
  def create
    @badge = Badge.new(badge_params)
    @badge.created_by=current_user.id
    respond_to do |format|
      if @badge.save
        format.html { redirect_to admin_badges_path, notice: 'Badge was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
 
  # PATCH/PUT admin/badges/1
  def update
    respond_to do |format|
      if @badge.update(badge_params.merge!(updated_by: current_user.id))
          format.html { redirect_to admin_badges_path, notice: 'Badge was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # GET admin/badges/1/edit
  def edit
  end

  def destroy
  end
  
  # GET admin/badges
  def index
    @badges = Badge.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_badge
      @badge = Badge.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def badge_params
      params.require(:badge).permit(:name, :reward, :notes, :emblem)
    end

end
