class StrivesController < ApplicationController
  before_action :set_user, only: [:new, :create]
  # GET /strives/new
  def new
    @strive = Strive.new
    set_collections()
  end




  # POST /strives
  # POST /strives.json
  def create
    
    unless params[:request_id].blank?
      request_id = params[:request_id]
      request  = StrivePolicy::Scope.new(current_user, Request.where(id: request_id).first).resolve_request
      @strive = Strive.new
      @strive.awarder_id = current_user.id
      @strive.awardee_id = request.recipient_id
      @strive.reason = request.reason
      @strive.badge_id = request.badge_id
      @strive.request_id = request.id
      @strive.strive_category_id = request.strive_category_id
    else
      @strive = Strive.new(strive_params.merge!({awardee_id:  @user.id,awarder_id: current_user.id}))
    end

    respond_to do |format|
      if @strive.award
        format.html { redirect_to user_path(@user), notice: 'Strive was successfully awarded.' }
        format.json { render :show, status: :created, location: @strive }
      else
        format.html { redirect_to requests_path, notice: "#{@strive.errors.first[1]}" }
        format.json { render json: @strive.errors, status: :unprocessable_entity }
      end
    end
  end


  private

    def set_collections
      @strive_categories = StriveCategory.order("name DESC").all
      @badges = Badge.where(id: [ENV['BRONZE_ID'].to_i,ENV['SILVER_ID'].to_i]).all

    end

    # Only allow a list of trusted parameters through.
    def strive_params
      if params[:request_id].present?
        params
      else
        params.require(:strive).permit(:awarder_id, :awardee_id, :badge_id, :strive_category_id, :reason)
      end
      
    end

    def set_user
      @user = User.where(active: true, id: params[:user_id]).first
    end
end
