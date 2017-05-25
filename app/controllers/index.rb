get '/' do
  Igdb::Game.count.to_s
end
