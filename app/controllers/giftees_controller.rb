class GifteesController < ApplicationController


get '/giftees' do
  if logged_in?
  @giftees = Giftee.all
  erb :'/giftees/index'
  else
  redirect to '/login'
end

end
get '/giftees/new' do
    if logged_in?
      erb :'giftees/new'
    else
      redirect to '/login'
    end
  end

post '/giftees' do
  if params[:name] || params[:gift] == ""
    redirect to '/giftees/new'
  else
    @giftee = current_user.giftees.create(params)
      redirect to ("/giftees/#{@giftee.id}")
    end
  end

get '/giftees/:id' do
  if logged_in?
    @giftee = Giftee.find_by(params[:id])
    if @giftee.user_id = current_user.id
      erb :'/giftees/show'
    else
      redirect to '/giftees'
    end
  else
    redirect to '/login'
  end
end

get '/giftees/:id/edit' do
  @giftee = Giftee.find_by(params[:id])
  if logged_in?
    @giftee.user_id = current_user.id
    erb :'/giftees/edit'
  else
    redirect to '/giftees'
  end
end

end
