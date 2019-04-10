class OwnersController < ApplicationController
  include ApplicationHelper
  include OwnersHelper

  def home
    @owners = Owner.all
  end

  def new
    @owner = Owner.new
  end

  def show
    if session[:owner_id]==id_from_url.to_i
      @owner = Owner.find_by(id: id_from_url)
    else
      flash[:message] = "You are accessing other owner's page!!"
      redirect_to owner_path(current_owner)
    end

  end

  def create
    @owner = Owner.create(owner_params)


    if !@owner.save
    return render 'new'
    end

    session[:owner_id] = @owner.id

    redirect_to owner_path(@owner)
  end

  private

   def id_from_url
     params.permit(:id)[:id]
   end

end
