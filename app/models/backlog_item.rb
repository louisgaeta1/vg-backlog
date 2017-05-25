class BacklogItem < ActiveRecord::Base
  validates :user_rating, :hours_played, :game_id, presence: true

  belongs_to :user
  # belongs_to :game, class_name: "GiantBomb::Game"
end
