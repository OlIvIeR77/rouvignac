class TarifsController < ApplicationController
  # GET /tarifs
  # GET /tarifs.json
  before_filter :authenticate_admin!, :only =>[:new, :create, :edit, :destroy, :update]

  before_filter :login_required
  
  def login_required
      if can_edit?
        true
      end
  end

  def index
    unless current_admin
      redirect_to "/tarifs/1"
    else
      @tarifs = Tarif.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @tarifs }
      end
    end
  end

  # GET /tarifs/1
  # GET /tarifs/1.json
  def show
    @tarif = Tarif.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tarif }
    end
  end

  # GET /tarifs/new
  # GET /tarifs/new.json
  def new
    @tarif = Tarif.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tarif }
    end
  end

  # GET /tarifs/1/edit
  def edit
    @tarif = Tarif.find(params[:id])
  end

  # POST /tarifs
  # POST /tarifs.json
  def create
    @tarif = Tarif.new(params[:tarif])

    respond_to do |format|
      if @tarif.save
        format.html { redirect_to @tarif, notice: 'Tarif was successfully created.' }
        format.json { render json: @tarif, status: :created, location: @tarif }
      else
        format.html { render action: "new" }
        format.json { render json: @tarif.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tarifs/1
  # PUT /tarifs/1.json
  def extract_params(params)
      attr = {}
      params[:content].each { |key, value| attr[key.to_sym] = value['value'] }
      attr
  end
  def update
    @tarif = Tarif.find(params[:id])

    respond_to do |format|
      if @tarif.update_attributes(extract_params(params))
        format.html { redirect_to @tarif, notice: 'Tarif was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tarif.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tarifs/1
  # DELETE /tarifs/1.json
  def destroy
    @tarif = Tarif.find(params[:id])
    @tarif.destroy

    respond_to do |format|
      format.html { redirect_to tarifs_url }
      format.json { head :no_content }
    end
  end
end
