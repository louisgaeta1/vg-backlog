class BacklogItem < ActiveRecord::Base
  validates :user_rating, :hours_played, :game_id, presence: true
  validates :hours_played, numericality: { greater_than_or_equal_to: 0 }
  validates :user_rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
  validates :game_id, uniqueness:{ scope: :user, message: "already in backlog" }
  belongs_to :user

  def game
    GiantBomb::Game.detail(game_id)
  end

end
