class DependentsController < ApplicationController
  before_action :set_dependent, only: %i[ show edit update destroy ]

  # GET /dependents or /dependents.json
  def index
    @dependents = Dependent.all
  end

  # GET /dependents/1 or /dependents/1.json
  def show
    @dependent = Dependent.find(params[:id])
    @documents = @dependent.documents
  end

  # GET /dependents/new
  def new
    @dependent = Dependent.new

  end

  # GET /dependents/1/edit
  def edit
  end

  # POST /dependents or /dependents.json
  def create
    @dependent = Dependent.new(dependent_params)

    respond_to do |format|
      if @dependent.save
        format.html { redirect_to dependent_url(@dependent), notice: "Dependent was successfully created." }
        format.json { render :show, status: :created, location: @dependent }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dependent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dependents/1 or /dependents/1.json
  def update
    respond_to do |format|
      if @dependent.update(dependent_params)
        format.html { redirect_to dependent_url(@dependent), notice: "Dependent was successfully updated." }
        format.json { render :show, status: :ok, location: @dependent }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dependent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dependents/1 or /dependents/1.json
  def destroy
    @dependent.destroy!

    respond_to do |format|
      format.html { redirect_to dependents_url, notice: "Dependent was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dependent
      @dependent = Dependent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dependent_params
      params.require(:dependent).permit(:user_id, :image_url, :address, :relationship, :first_name, :last_name, :date_of_birth, :immigration_status, :country_of_citizenship, :contact_info)
    end
end
