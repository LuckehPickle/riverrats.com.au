# frozen_string_literal: true

# Awarded to players for reaching a certain score threshold
class ScoreAchievement < Achievement
  def self.check_conditions_for(player)
    awarded = player.awarded? self

    if awarded
      achievement = player.achievements.find_by(type: sti_name)
      achievement.check
    end

    player.award self if !awarded && player.score >= requirements[0]

    awarded
  end

  def check
    requirements = self.class.requirements

    # We can go higher
    if requirements.length > level + 1
      # Check conditions
      if player.score >= requirements[level + 1]
        player.award self.class, level + 1
      end
    end
  end

  def title
    format(I18n.t('achievement.score.title'), level: (level + 1).to_roman)
  end

  def description
    format(I18n.t('achievement.score.description'),
           score: ScoreAchievement.requirements[level])
  end

  def self.type
    :single
  end

  def self.requirements
    [50, 1000, 2500, 5000, 10_000, 25_000, 50_000]
  end
end
