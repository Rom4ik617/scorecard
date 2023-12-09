class Contributor < ApplicationRecord
  has_many :events

  def total_score
    events.sum(&:score)
  end
end
