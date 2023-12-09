class Event < ApplicationRecord
  belongs_to :contributor

  enum event_type: { pull_request: 12, comment: 1, review: 3 }

  validates :event_type, presence: true
  validates :contributor, presence: true

  after_create :update_contributor_score

  def update_contributor_score
    contributor.update(total_score: contributor.total_score + score)
  end

  def score
    Event.event_types[event_type]
  end
end
