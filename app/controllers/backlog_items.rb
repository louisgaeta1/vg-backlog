post '/users/:user_id/games/:game_id/backlog_items' do
  @user = User.find(params[:user_id])
  @items = @user.backlog_items
  params[:backlog_item]["game_id"] = params[:game_id]
  redirect '/' unless authorized?(@user)
  @items.create(params[:backlog_item])
  redirect "/users/#{@user.id}"
end

get '/users/:user_id/backlog_items/:backlog_item_id/edit' do
  @user = User.find(params[:user_id])
  @item = BacklogItem.find(params[:backlog_item_id])
  redirect '/' unless authorized?(@user)
  erb :'backlog_items/edit'
end

put '/users/:user_id/backlog_items/:backlog_item_id' do
  user = User.find(params[:user_id])
  backlog_item = BacklogItem.find(params[:backlog_item_id])
  redirect '/' unless authorized?(user)
  backlog_item.assign_attributes(params[:backlog_item])
  backlog_item.save
  redirect "/users/#{user.id}"
end

delete '/users/:user_id/backlog_items/:backlog_item_id' do
  user = User.find(params[:user_id])
  backlog_item = BacklogItem.find(params[:backlog_item_id])
  redirect '/' unless authorized?(user)
  backlog_item.destroy
  redirect "/users/#{user.id}"
end
