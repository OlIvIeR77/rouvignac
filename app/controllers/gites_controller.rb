class GitesController < ApplicationController
  # GET /gites
  # GET /gites.json
  before_filter :authenticate_admin!, :only =>[:new, :create, :edit, :destroy, :update]
  def index
    #binding.pry
    @gites = Gite.order(:title)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gites }
    end
  end

  # GET /gites/1
  # GET /gites/1.json
  def show
    @gite = Gite.friendly.find(current_gite)

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
    @gite = Gite.find(current_gite)
  end

  # POST /gites
  # POST /gites.json
  def create
    @gite = Gite.new(gite_params)

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
    @gite = Gite.find(current_gite)

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

  def update2
    @gite = Gite.find(current_gite)
    #binding.pry
    respond_to do |format|
      if @gite.update_attributes(gite_params)
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
    @gite = Gite.find(current_gite)
    @gite.destroy

    respond_to do |format|
      format.html { redirect_to gites_url }
      format.json { head :no_content }
    end
  end

  private
  def current_gite
    params.require(:id)
  end
  def gite_params
    params.require(:gite).permit(:id, :title, :text1, :text2, :text3, :text4, :text5, :text6, :text7, :text8, :text9, :text10, :created_at, :updated_at, :slug, :image)
  end
end
