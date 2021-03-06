class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]
  before_action :set_collections, only: [:new, :edit, :create, :update]
  # GET /requests
  # GET /requests.json
  def index
    @requests = Request.order("id desc").all
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
  end

  # GET /requests/new
  def new
    @request = Request.new
  end

  # GET /requests/1/edit
  def edit
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(request_params.merge!(requestor_id: current_user.id))
    respond_to do |format|
      if @request.save
        format.html { redirect_to requests_url, notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params.merge!(requestor_id: current_user.id))
        format.html { redirect_to requests_url, notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end
    def set_collections
      @requestees = User.where(active: true).where.not(role: 1).all - [current_user]
      @backers = User.where(active: true).all - [current_user]
      @recipients =  [User.new(id: current_user.id, name: "Me")] + User.where(active: true).where.not(id: current_user.id).all
      @strive_categories = StriveCategory.all
      @badges = Badge.where(name: ["Bronze", "Silver"]).all
    end

    # Only allow a list of trusted parameters through.
    def request_params
      params.require(:request).permit(:requestor_id, :requestee_id, :recipient_id, :reason, :strive_category_id, :backer_id, :badge_id)
    end
end
