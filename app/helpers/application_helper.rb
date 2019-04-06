module ApplicationHelper

  def logged_in?
       !!current_owner
  end

   def current_owner
     @current_owner ||= Owner.find_by(id: session[:owner_id]) if session[:owner_id]
   end


   def redirect_if_not_logged_in
     if !logged_in?
       flash[:message] = "Something is wrong, login again"
       redirect "/login"
     end
   end
end
