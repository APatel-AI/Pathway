class DependentsController < ApplicationController
  before_action :set_dependent, only: %i[ show edit update destroy ]
  before_action :ensure_current_user_is_creator, only: %i[show edit update destroy]
  before_action :set_breadcrumbs, only: %i[index show new edit]

  # GET /dependents or /dependents.json
  def index
    @dependents = current_user.dependents
    add_breadcrumb "Dependents", dependents_path
  end

  # GET /dependents/1 or /dependents/1.json
  def show
    @dependent = Dependent.find(params[:id])
    @documents = @dependent.documents
    add_breadcrumb "Dependents", dependents_path
    add_breadcrumb @dependent.first_name, dependent_path(@dependent)
  end

  # GET /dependents/new
  def new
    @dependent = Dependent.new
    add_breadcrumb "Dependents", dependents_path
    add_breadcrumb "New Dependent", new_dependent_path
  end

  # GET /dependents/1/edit
  def edit
    add_breadcrumb "Dependents", dependents_path
    add_breadcrumb @dependent.first_name, dependent_path(@dependent)
    add_breadcrumb "Edit Dependent", edit_dependent_path(@dependent)
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

  def set_dependent
    @dependent = Dependent.find(params[:id])
  end

  def ensure_current_user_is_creator
    if @dependent.user_id != current_user.id
      redirect_back fallback_location: root_url, alert: "You're not authorized for that."
    end
  end

  def set_breadcrumbs
    @breadcrumbs = []
  end

  def add_breadcrumb(content, href = nil)
    @breadcrumbs << { content: content, href: href }
  end

  def dependent_params
    params.require(:dependent).permit(:user_id, :image, :address, :relationship, :first_name, :last_name, :date_of_birth, :immigration_status, :country_of_citizenship, :contact_info)
  end
end
