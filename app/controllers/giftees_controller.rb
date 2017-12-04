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
    if !logged_in?
      redirect to '/login'
    end

    @giftee = current_user.giftees.build(:name => params[:name], :gift => params[:gift])
    if @giftee.save
      redirect to ("/giftees/#{@giftee.id}")
    else
      redirect to '/giftees/new'
    end
  end

get '/giftees/:id' do
  authenticate_user!

  @giftee = Giftee.find_by_id(params[:id])
  if @giftee && @giftee.user_id == current_user.id
    erb :'/giftees/show'
  else
    redirect to '/giftees'
  end
end

get '/giftees/:id/edit' do
  authenticate_user!
  @giftee = Giftee.find_by_id(params[:id])
  if @giftee && @giftee.user == current_user
    erb :'/giftees/edit'
  else
    redirect to '/giftees'
  end
end

patch '/giftees/:id' do
    @giftee = Giftee.find_by_id(params[:id])
  if @giftee.update(:name => params[:name], :gift => params[:gift])
    redirect to "/giftees/#{@giftee.id}"
  else
    redirect to "/giftees/#{params[:id]}/edit"
  end
end

delete '/giftees/:id/delete' do
  @giftee = Giftee.find_by_id(params[:id])
  if logged_in? && @giftee.user_id == current_user.id
    @giftee.delete
    redirect to '/giftees'
  else
    redirect to '/giftees'
  end
end

end
