require 'rails_helper'

RSpec.describe WeeklyContributor, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:week_start) }
    it { should validate_presence_of(:contributor) }
    it { should validate_presence_of(:points) }
    it { should validate_numericality_of(:points).only_integer.is_greater_than_or_equal_to(0) }
  end

  describe 'scopes' do
    it 'returns top contributors' do
      create(:weekly_contributor, week_start: Date.today, points: 10)
      create(:weekly_contributor, week_start: Date.today, points: 5)
      create(:weekly_contributor, week_start: Date.today, points: 8)

      top_contributors = WeeklyContributor.top_contributors(Date.today)
      expect(top_contributors.count).to eq(3)
      expect(top_contributors.first.points).to be >= top_contributors.last.points
    end
  end

  describe 'class methods' do
    it 'returns weekly total points' do
      create(:weekly_contributor, week_start: Date.today, points: 10)
      create(:weekly_contributor, week_start: Date.today, points: 5)

      total_points = WeeklyContributor.weekly_total_points(Date.today)
      expect(total_points).to eq(15)
    end
  end
end
