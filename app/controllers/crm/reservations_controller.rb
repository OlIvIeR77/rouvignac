class Crm::ReservationsController < Crm::BaseController

  before_action :authenticate_admin!
  before_action :current_reservation, only: [:edit, :show, :update]

  def index
    @reservations = Reservation.all
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to [:crm, @reservation], notice: 'Reservation was successfully created.'
    else
      render 'new'
    end
  end

  def new
    @reservation = Reservation.new
  end

  def edit
  end

  def update
    if @reservation.update_attributes(reservation_params)
      redirect_to [:crm, @reservation], notice: 'Reservation was successfully updated.'
    else
      render 'edit'
    end
  end

  def show
  end

  private
  def current_reservation
    @reservation = Reservation.find params.require(:id)
  end

  def reservation_params
    params.require(:reservation).permit(:id, :from, :to, :client_id, :price)
  end

end
