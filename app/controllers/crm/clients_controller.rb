class Crm::ClientsController < Crm::BaseController

  before_action :authenticate_admin!
  before_action :current_client, only: [:edit, :show, :update, :destroy]

  def index
    @clients = Client.all
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to [:crm, @client], notice: 'Client was successfully created.'
    else
      render 'new'
    end
  end

  def new
    @client = Client.new
  end

  def edit
  end

  def update
    if @client.update_attributes(client_params)
      redirect_to [:crm, @client], notice: 'Client was successfully updated.'
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    if @client.destroy
      redirect_to crm_clients_path, notice: 'Client was successfully destroyed.'
    else
      redirect_to :back
    end
  end

  private
  def current_client
    @client = Client.find params.require(:id)
  end

  def client_params
    params.require(:client).permit(:id, :first_name, :last_name, :email, :phone_number, :address, :postal_code, :city, :number, :mobile_phone_number)
  end

end
