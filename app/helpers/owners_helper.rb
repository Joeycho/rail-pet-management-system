module OwnersHelper

  def owner_params
    params.require(:owner).permit(:name, :email, :password, :password_confirmation)
  end


end
