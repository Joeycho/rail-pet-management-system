class OwnersController < ApplicationController
  def home
    @owners = Owner.all
  end

  def new
    @owner = Owner.new
  end

  def show
  end

  def create
    @owner = Owner.create(owner_params)
    binding.pry
    return redirect_to controller: 'owners', action: 'new' unless @owner.save
    session[:owner_id] = @owner.id

    render 'sessions/create'
  end

  private
  def owner_params
    params.require(:owner).permit(:name, :email, :password, :password_confirmation)
  end

end
