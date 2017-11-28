require 'rack-flash'

class UsersController < ApplicationController
use Rack::Flash

get '/signup' do
  if !logged_in?
    erb :'/users/signup'
  else
    redirect to '/giftees'
  end
end

post '/signup' do
  if params[:name].empty? || params[:password].empty?
  flash[:message] = "Please enter a username and password"
  redirect to '/signup'
  else @user = User.create(params)
  session[:user_id] = @user.id
  redirect to '/giftees'
end
end

get '/login' do
  if !logged_in?
    erb :'/users/login'
  else
    redirect to '/giftees'
  end
end

post '/login' do
    user = User.find_by(:name => params[:name])
    if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect to '/giftees'
    else params[:name].empty? || params[:password].empty?
    flash[:message] = "Please enter a username and password"
    redirect to '/login'
  end
end

get '/logout' do
  session.clear
  redirect to '/login'
end

end
