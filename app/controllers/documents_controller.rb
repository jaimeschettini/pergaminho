class DocumentsController < ApplicationController

  # GET /documents
  # GET /documents.json
  def index
    @documents = Document.all
    @document = Document.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @documents }
    end
  end

  def search
    @document = Document.new(params[:document])
    @documents = @document.search
    render :action => :index
  end

  # GET /documents/new
  # GET /documents/new.json
  def new
    @document = Document.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /documents/1/edit
  def edit
    @document = Document.find(params[:id])
  end

  # POST /documents
  # POST /documents.json
  def create
    @document = Document.new(params[:document])
    @document.group_id = Group.first.id

    respond_to do |format|
      if @document.save
        format.html { redirect_to documents_path, notice: 'O documento foi criado com sucesso.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /documents/1
  # PUT /documents/1.json
  def update
    @document = Document.find(params[:id])

    respond_to do |format|
      if @document.update_attributes(params[:document])
        format.html { redirect_to documents_path, :notice => 'O documento foi atualizado com sucesso.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document = Document.find(params[:id])
    @document.destroy

    respond_to do |format|
      format.html { redirect_to documents_url }
    end
  end
end
