class Crm::GitesController < Crm::BaseController

  before_filter :authenticate_admin!, :only =>[:new, :create, :edit, :destroy, :update]
  def index
    @gites = Gite.order(:title)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gites }
    end
  end

  def show
    @gite = Gite.friendly.find(current_gite)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gite }
    end
  end

  def new
    @gite = Gite.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gite }
    end
  end

  def edit
    @gite = Gite.find(current_gite)
  end

  def edit_calendar
    @gite = Gite.find_by(slug: current_gite)
  end

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

  def update
    @gite = Gite.find(current_gite)
    respond_to do |format|
      if @gite.update_attributes(gite_params)
        format.html { redirect_to [:crm, @gite], notice: 'Gite was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gite.errors, status: :unprocessable_entity }
      end
    end
  end

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
    params.require(:gite).permit(:id, :title, :text1, :text2, :text3, :text4, :text5, :text6, :text7, :text8, :text9, :text10, :created_at, :updated_at, :slug, :image, :bed_120x190, :bed_160x200, :bed_140x190, :bed_90x190, :bed_90x200, :armchair_90x190, :energy_type, :cleaning_price, beds: [])
  end
end
