get '/games/page/:page_id' do
  @games = GiantBomb::Game.list(offset: ((params[:page_id].to_i - 1) * 50).to_s)
  erb :'games/index'
end

get '/games/:game_id' do
  @game = GiantBomb::Game.detail(params[:game_id])
  erb :'games/show'
end
