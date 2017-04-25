class Crm::LeaseAgreementsController < Crm::BaseController

  before_action :authenticate_admin!

  def show
    #binding.pry
    @reservation = Reservation.find params.require(:id)
    @client = @reservation.client
    @gite = @reservation.gite
    respond_to do |format|
      format.pdf do
        render :pdf => "lease_agreement.pdf",
          :disposition => "inline",
          :template => "crm/lease_agreements/show.pdf.erb",
          :layout => "crm/pdf_layout.html.erb"#,
          #viewport_size: "1280x1024"
      end 
      #format.html
    end
      # format.html
      # format.pdf do
      #   render pdf: "file_name"   # Excluding ".pdf" extension.
      # end
  end
end


