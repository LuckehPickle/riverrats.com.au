class Event < ApplicationRecord

  belongs_to :venue

  default_scope { order(:start_at) }

  validates :venue, :start_at,
            presence: true

  validates :title,
            length: { within: 3..32 },
            allow_blank: true

  ###
  # Returns either the events title, or an untitled label.
  def clean_title
    if title.blank? or title.nil?
      return 'Untitled event'
    end
    title
  end

end
