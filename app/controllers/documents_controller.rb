class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update]

  # GET /documents
  # GET /documents.json
  def index
    @documents = Document.where(user_id: current_user)
    @user = current_user
    @categories = @user.categories.order(:name)
    @deleted_documents = Document.only_deleted.where(user_id: current_user)
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
  end

  # GET /documents/new
  def new
    @document = current_user.documents.build
    @user = current_user
    @categories = @user.categories.order(:name)
  end

  # GET /documents/1/edit
  def edit
    @user = current_user
    @categories = @user.categories.order(:name)
  end

  # POST /documents
  # POST /documents.json
  def create
    @document = current_user.documents.build(document_params)
    @user = current_user
    @categories = @user.categories.order(:name)

    respond_to do |format|
      if @document.save
        format.html { render :edit, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update
    @user = current_user
    @categories = @user.categories.order(:name)

    respond_to do |format|
      if @document.update(document_params)
        format.html { render :edit }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @user = current_user
    @document = @user.documents.with_deleted.find(params[:id])

    if params[:type] == nil
      @document.destroy
    elsif params[:type] == 'forever'
      @document.really_destroy!
    elsif params[:type] == 'undelete'
      @document.restore
    end

    respond_to do |format|
      format.html { redirect_to documents_url, notice: 'Document archived.' }
      format.json { head :no_content }
    end
  end

  def archive
    @document = Document.only_deleted.where(user_id: current_user)
    @documents = Document.only_deleted.where(user_id: current_user)
    @user = current_user
    @categories = @user.categories.order(:name)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params.require(:document).permit(:title, :content, :category_id, :new_category_name)
    end
end
