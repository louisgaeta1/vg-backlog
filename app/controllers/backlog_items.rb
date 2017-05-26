post '/users/:user_id/games/:game_id/backlog_items' do
  @user = User.find(params[:user_id])
  @items = @user.backlog_items
  params[:backlog_item]["game_id"] = params[:game_id]
  redirect '/' unless authorized?(@user)
  item = @items.new(params[:backlog_item])
  item.user_rating = 0 if item.user_rating < 0 || item.user_rating > 10
  item.hours_played = 0 if item.hours_played < 0
  @game = item.game
  if item.save
    redirect "/users/#{@user.id}"
  else
    @errors = item.errors.full_messages
    erb :'games/show'
  end
end

get '/users/:user_id/backlog_items/:backlog_item_id/edit' do
  @user = User.find(params[:user_id])
  @item = BacklogItem.find(params[:backlog_item_id])
  redirect '/' unless authorized?(@user)
  erb :'backlog_items/edit'
end

put '/users/:user_id/backlog_items/:backlog_item_id' do
  user = User.find(params[:user_id])
  @item = BacklogItem.find(params[:backlog_item_id])
  redirect '/' unless authorized?(user)
  @item.assign_attributes(params[:backlog_item])
  if @item.save
    redirect "/users/#{user.id}"
  else
    @errors = @item.errors.full_messages
    erb :'backlog_items/edit'
  end
end

delete '/users/:user_id/backlog_items/:backlog_item_id' do
  user = User.find(params[:user_id])
  backlog_item = BacklogItem.find(params[:backlog_item_id])
  redirect '/' unless authorized?(user)
  backlog_item.destroy
  redirect "/users/#{user.id}"
end
