class UsersController < ApplicationController


get '/signup' do
  if !logged_in?
    erb :'users/signup'
  else
    redirect to '/giftees'
  end
end

post '/signup' do
  @user = User.create(params)
  session[:user_id] = @user.id
  redirect to '/giftees'
else
  redirect to '/signup'
end

get '/login' do
  if !logged_in?
    erb :'users/login'
  else
    redirect to '/giftees'
  end
end

post '/login' do
  user = User.find_by(params[:username])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect to '/giftees'
  else
    redirect to '/login'
  end
end

get '/logout' do
  session.clear
  redirect to '/login'
end

end