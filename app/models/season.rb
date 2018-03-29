class Season < ApplicationRecord

  has_many :players_seasons,
           class_name: 'PlayersSeasons',
           dependent: :nullify
  has_many :players, through: :players_seasons

  validates :start_at, :end_at,
            presence: true

end
