module ClinicsHelper

  def clinic_params
    params.require(:clinic).permit(:name, :addr)
  end

end
