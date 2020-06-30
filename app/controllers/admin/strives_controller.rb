class Admin::StrivesController < Admin::BaseController
  before_action :set_strife, only: [:show, :edit, :update, :destroy]

  # GET /strives
  # GET /strives.json
  def index
    @strives = Strive.all
  end

  # GET /strives/1
  # GET /strives/1.json
  def show
  end

  # GET /strives/new
  def new
    @strife = Strive.new
  end

  # GET /strives/1/edit
  def edit
  end

  # POST /strives
  # POST /strives.json
  def create
    @strife = Strive.new(strife_params)

    respond_to do |format|
      if @strife.save
        format.html { redirect_to @strife, notice: 'Strive was successfully created.' }
        format.json { render :show, status: :created, location: @strife }
      else
        format.html { render :new }
        format.json { render json: @strife.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /strives/1
  # PATCH/PUT /strives/1.json
  def update
    respond_to do |format|
      if @strife.update(strife_params)
        format.html { redirect_to @strife, notice: 'Strive was successfully updated.' }
        format.json { render :show, status: :ok, location: @strife }
      else
        format.html { render :edit }
        format.json { render json: @strife.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /strives/1
  # DELETE /strives/1.json
  def destroy
    @strife.destroy
    respond_to do |format|
      format.html { redirect_to strives_url, notice: 'Strive was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_strife
      @strife = Strive.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def strife_params
      params.require(:strife).permit(:awarder_id, :awardee_id, :badge_id, :strive_category_id, :reason, :cashed_out)
    end
end
