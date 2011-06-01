class SessionsController < ApplicationController

def new
end

def create
  user = User.authenticate(params[:email], params[:password])
  if user
    session[:user_id] = user.id
	#session[:user_email] = user.email
    redirect_to root_url, :notice => "Zalogowano!"
  else
    flash.now.alert = "Błędny email lub hasło"
    render "new"
  end
end

def destroy
	if !current_user
		respond_to do |format|
			format.html { redirect_to(reports_url) }
		end
	else
		session[:user_id] = nil
		#session[:user_email] = nil
		redirect_to root_url, :notice => "Poprawnie wylogowano!"
	end
end

end