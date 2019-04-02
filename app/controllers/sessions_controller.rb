require 'pry'
class SessionsController < ApplicationController

  def new
  end

  def create

    @owner = Owner.find_or_create_by(uid: auth['uid']) do |u|
          u.name = auth['info']['name']
          u.email = auth['info']['email']
          u.image = auth['info']['image']
        end

      session[:user_id] = @owner.id

      render 'sessions/create'
  end

  def destroy
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
