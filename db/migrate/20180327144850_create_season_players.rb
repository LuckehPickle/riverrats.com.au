# frozen_string_literal: true

class CreateSeasonPlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players_seasons do |t|
      t.belongs_to :season,       index: true
      t.belongs_to :player,       index: true
      t.integer    :score,        null: false, default: 0
      t.integer    :games_played, null: false, default: 0
      t.integer    :games_won,    null: false, default: 0
      t.timestamps
    end
  end
end
