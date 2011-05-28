RailsAdmin.authenticate_with do
 if !current_user 
 redirect_to root_url 
 end
end

RailsAdmin.authorize_with do
  if !current_user
  redirect_to root_url 
  end
end