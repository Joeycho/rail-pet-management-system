require 'pry'
class SessionsController < ApplicationController
include ApplicationHelper

  def new
    if logged_in?
      flash[:message] = "You are already logged in. Please logout first, if you want to login as other owner"
      redirect_to(current_owner)
    end
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
        session[:owner_id] = @owner.id
        flash[:message] = "Login successful with your facebook account"
    else
      owner = Owner.find_by(name: owner_params[:name])

      owner = owner.try(:authenticate, owner_params[:password])

      return redirect_to(controller: 'sessions', action: 'new') unless owner

      session[:owner_id] = owner.id

      @owner = owner
      #redirect_to controller: 'owners', action: 'home'
    end

    redirect_to owner_path(@owner)



  end

  def destroy
    session.clear
    redirect_to root_path
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
