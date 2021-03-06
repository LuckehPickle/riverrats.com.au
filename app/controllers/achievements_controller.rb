# frozen_string_literal: true

# A controller for achievements
class AchievementsController < ApplicationController
  # GET /player/:username/achievements
  def index
    @player = Player.find_by!(username: params[:player_username])
    @achievements = @player.achievements.page(params[:page])
  end

  # GET /player/:username/achievements/:id
  def show; end
end
