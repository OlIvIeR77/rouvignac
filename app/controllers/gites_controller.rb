class GitesController < ApplicationController
  # GET /gites
  # GET /gites.json
  def index
    @gites = Gite.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gites }
    end
  end

  # GET /gites/1
  # GET /gites/1.json
  def show
    @gite = Gite.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gite }
    end
  end

  # GET /gites/new
  # GET /gites/new.json
  def new
    @gite = Gite.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gite }
    end
  end

  # GET /gites/1/edit
  def edit
    @gite = Gite.find(params[:id])
  end

  # POST /gites
  # POST /gites.json
  def create
    @gite = Gite.new(params[:gite])

    respond_to do |format|
      if @gite.save
        format.html { redirect_to @gite, notice: 'Gite was successfully created.' }
        format.json { render json: @gite, status: :created, location: @gite }
      else
        format.html { render action: "new" }
        format.json { render json: @gite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gites/1
  # PUT /gites/1.json
  def extract_params(params)
      attr = {}
      params[:content].each { |key, value| attr[key.to_sym] = value['value'] }
      attr
  end
  def update
    @gite = Gite.find(params[:id])

    respond_to do |format|
      if @gite.update_attributes(extract_params(params))
        format.html { redirect_to @gite, notice: 'Gite was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gites/1
  # DELETE /gites/1.json
  def destroy
    @gite = Gite.find(params[:id])
    @gite.destroy

    respond_to do |format|
      format.html { redirect_to gites_url }
      format.json { head :no_content }
    end
  end
end
