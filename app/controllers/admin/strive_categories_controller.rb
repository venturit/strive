class Admin::StriveCategoriesController < Admin::BaseController
  before_action :set_strive_category, only: [:edit, :update, :destroy]

  # GET /strive_categories
  # GET /strive_categories.json
  def index
    @strive_categories = StriveCategory.all
  end

  # GET /admin/strive_categories/new
  def new
    @strive_category = StriveCategory.new
  end

  # GET  /admin/strive_categories/1/edit
  def edit
  end

  # POST  /admin/strive_categories
  # POST  /admin/strive_categories.json
  def create
    @strive_category = StriveCategory.new(strive_category_params)
    @strive_category.created_by=current_user.id
    respond_to do |format|
      if @strive_category.save
        format.html { redirect_to admin_strive_categories_url, notice: 'Strive category was successfully created.' }
        format.json { render :show, status: :created, location: @strive_category }
      else
        format.html { render :new }
        format.json { render json: @strive_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT  /admin/strive_categories/1
  # PATCH/PUT  /admin/strive_categories/1.json
  def update
    respond_to do |format|
      if @strive_category.update(strive_category_params.merge!(updated_by: current_user.id))
        format.html { redirect_to admin_strive_categories_url, notice: 'Strive category was successfully updated.' }
        format.json { render :show, status: :ok, location: @strive_category }
      else
        format.html { render :edit }
        format.json { render json: @strive_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE  /admin/strive_categories/1
  # DELETE  /admin/strive_categories/1.json
  def destroy
    @strive_category.destroy
    respond_to do |format|
      format.html { redirect_to admin_strive_categories_url, notice: 'Strive category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_strive_category
      @strive_category = StriveCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def strive_category_params
      params.require(:strive_category).permit(:name, :description, :updated_by, :created_by)
    end
end
