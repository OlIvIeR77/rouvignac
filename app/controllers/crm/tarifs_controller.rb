class Crm::TarifsController < Crm::BaseController
  # GET /tarifs
  # GET /tarifs.json
  before_filter :authenticate_admin!, :only =>[:edit, :update]

  #before_filter :login_required

  #def login_required
  #    if can_edit?
  #      true
  #    end
  #end

  #def index
  #  unless current_admin
  #    redirect_to "/tarifs/1"
  #  else
  #    @tarifs = Tarif.all

  #    respond_to do |format|
  #      format.html # index.html.erb
  #      format.json { render json: @tarifs }
  #    end
  #  end
  #end

  # GET /tarifs/1
  # GET /tarifs/1.json
  def show
    #binding.pry
    @tarif = Tarif.find(current_tarif)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tarif }
    end
  end

  # GET /tarifs/new
  # GET /tarifs/new.json
  #def new
  #  redirect_to tarifs_path
  #  #@tarif = Tarif.new

  #  respond_to do |format|
  #    format.html # new.html.erb
  #    format.json { render json: @tarif }
  #  end
  #end

  # GET /tarifs/1/edit
  def edit
    @tarif = Tarif.find(current_tarif)
  end

  # POST /tarifs
  # POST /tarifs.json
  #def create
    #@tarif = Tarif.new(tarif_params[:tarif])
    #redirect_to tarifs_path

    #respond_to do |format|
    #  if @tarif.save
    #    format.html { redirect_to @tarif, notice: 'Tarif was successfully created.' }
    #    format.json { render json: @tarif, status: :created, location: @tarif }
    #  else
    #    format.html { render action: "new" }
    #    format.json { render json: @tarif.errors, status: :unprocessable_entity }
    #  end
    #end
  #end

  # PUT /tarifs/1
  # PUT /tarifs/1.json
  #def extract_params(params)
  #    attr = {}
  #    params[:content].each { |key, value| attr[key.to_sym] = value['value'] }
  #    attr
  #end

  def update
    #binding.pry
    @tarif = Tarif.find(current_tarif)

    respond_to do |format|
      if @tarif.update_attributes(tarif_params)
        format.html { redirect_to [:crm, @tarif], notice: 'Tarif was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tarif.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tarifs/1
  # DELETE /tarifs/1.json
  #def destroy
  #  @tarif = Tarif.find(params[:id])
  #  @tarif.destroy

  #  respond_to do |format|
  #    format.html { redirect_to tarifs_url }
  #    format.json { head :no_content }
  #  end
  #end

  private
  def current_tarif
    params.require(:id)
  end
  def tarif_params
    params.require(:tarif).permit(:id, :year, :prixa1, :prixa2, :prixa3, :prixb1, :prixb2, :prixb3, :prixc1, :prixc2, :prixc3, :prixd1, :prixd2, :prixd3, :prixe1, :prixe2, :prixe3, :prixf1, :prixf2, :prixf3, :prixg1, :prixg2, :prixg3, :prixh1, :prixh2, :prixh3, :prixi1, :prixi2, :prixi3, :prixj1, :prixj2, :prixj3, :prixk1, :prixk2, :prixk3, :prixl1, :prixl2, :prixl3)
  end
end
