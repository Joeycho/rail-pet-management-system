class ClinicsController < ApplicationController
  include ApplicationHelper
  def index
    redirect_if_not_logged_in
    @clinics = Clinic.all
    @avaiables = Clinic.available_clinic
  end

end
