require 'pry'
class SessionsController < ApplicationController

  def new
  end

  def create

    if auth!=nil
        @owner = Owner.find_or_create_by(uid: auth['uid']) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.image = auth['info']['image']
            u.password = SecureRandom.hex(9)
          end
        @owner.save

        binding.pry
        session[:user_id] = @owner.id
    else
      owner = Owner.find_by(name: owner_params[:name])

      owner = owner.try(:authenticate, owner_params[:password])

      return redirect_to(controller: 'sessions', action: 'new') unless owner

      session[:owner_id] = owner.id

      @owner = owner

      render 'sessions/create'
      #redirect_to controller: 'owners', action: 'home'
    end



  end

  def destroy
  end

  private

  def auth
    request.env['omniauth.auth']
  end

  def owner_params
    params.require(:owner).permit(
      :email, :password, :name, :password_confirmation
    )
  end

end
