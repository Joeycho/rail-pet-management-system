class ClinicsController < ApplicationController
  include ApplicationHelper
  include ClinicsHelper

  def index
    redirect_if_not_logged_in
    @clinics = Clinic.all
    @avaiables = Clinic.available_clinic
  end

  def new
    @clinic = Clinic.new
  end

  def create

    @clinic = Clinic.create(clinic_params)

    if !@clinic.save
      return render 'new'
    end

    redirect_to clinics_path
  end

  def show
    @clinic = Clinic.find_by(id: params[:id])

    if !@clinic
      #flash[:]
      redirect_to clinics_path
    end

  end

end
