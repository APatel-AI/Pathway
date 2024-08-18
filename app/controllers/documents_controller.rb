# frozen_string_literal: true

class DocumentsController < ApplicationController
  before_action :set_document, only: %i[show edit update destroy]
  before_action :set_dependent, only: %i[new create]
  before_action :set_breadcrumbs, only: %i[index show new edit]

  # GET /documents or /documents.json
  def index
    @documents = Document.includes(:file_attachment).all
    add_breadcrumb 'Documents', documents_path
  end

  # GET /documents/1 or /documents/1.json
  def show
    add_breadcrumb 'Documents', documents_path
    add_breadcrumb @document.name, document_path(@document)
  end

  # GET /documents/new
  def new
    @document = @dependent ? @dependent.documents.build : Document.new
    add_breadcrumb 'Documents', documents_path
    add_breadcrumb 'New Document', new_dependent_document_path
  end

  # GET /documents/1/edit
  def edit
    @dependent = @document.dependent
    add_breadcrumb 'Documents', documents_path
    add_breadcrumb @document.name, document_path(@document)
    add_breadcrumb 'Edit Document', edit_dependent_document_path(@document)
  end

  # POST /documents or /documents.json
  def create
    @document = @dependent ? @dependent.documents.build(document_params) : Document.new(document_params)

    respond_to do |format|
      if @document.save
        format.html { redirect_to dependent_path(@dependent), notice: 'Document was successfully created.' }
        format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documents/1 or /documents/1.json
  def update
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to dependent_path(@dependent), notice: 'Document was successfully updated.' }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1 or /documents/1.json
  def destroy
    @document.destroy!
    respond_to do |format|
      format.html { redirect_to documents_url, notice: 'Document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_document
    @document = Document.includes(:file_attachment).find(params[:id])
    @dependent = @document.dependent
  end

  def set_dependent
    @dependent = Dependent.find(params[:dependent_id]) if params[:dependent_id]
  end

  def set_breadcrumbs
    @breadcrumbs = []
  end

  def add_breadcrumb(content, href = nil)
    @breadcrumbs << { content:, href: }
  end

  def document_params
    params.require(:document).permit(:name, :expiry_date, :summary, :status, :file)
  end
end
