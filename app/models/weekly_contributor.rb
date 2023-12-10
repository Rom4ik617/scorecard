class WeeklyContributor < ApplicationRecord
    validates :week_start, :contributor, :points, presence: true
    validates :points, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

    scope :top_contributors, ->(week_start) { where(week_start: week_start).order(points: :desc).limit(3) }
  
    def self.weekly_total_points(week_start)
      where(week_start: week_start).sum(:points)
    end
end
