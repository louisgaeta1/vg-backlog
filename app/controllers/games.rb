get '/games/page/:page_id' do
  if params[:query]
    search = GiantBomb::Search.new().resources('game').query(params[:query]).limit(50)
    @games = search.fetch
  else
    @games = GiantBomb::Game.list(offset: ((params[:page_id].to_i - 1) * 50).to_s, limit: 50).map{ |game| JSON.parse(game.to_json) }
  end
  erb :'games/index'
end

get '/games/:game_id' do
  @game = GiantBomb::Game.detail(params[:game_id])
  erb :'games/show'
end
