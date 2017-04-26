class Crm::EnergyPricesController < Crm::BaseController

  before_action :authenticate_admin!
  before_action :energy_price, only: [:edit, :show, :update]

  def index
    @energy_prices = EnergyPrice.all
  end

  def create
    @energy_price = EnergyPrice.new(energy_price_params)
    if @energy_price.save
      redirect_to [:crm, @energy_price], notice: 'energy_price was successfully created.'
    else
      render 'new'
    end
  end

  def new
    @energy_price = EnergyPrice.new
  end

  def edit
  end

  def update
    if @energy_price.update_attributes(energy_price_params)
      redirect_to [:crm, @energy_price], notice: 'energy_price was successfully updated.'
    else
      render 'edit'
    end
  end

  def show
  end

  private
  def energy_price
    @energy_price = EnergyPrice.find params.require(:id)
  end

  def energy_price_params
    params.require(:energy_price).permit(:id, :energy_type, :price)
  end

end
