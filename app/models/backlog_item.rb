class BacklogItem < ActiveRecord::Base
  validates :user_rating, :hours_played, :game_id, presence: true

  belongs_to :user

  def game
    GiantBomb::Game.detail(game_id)
  end

end
