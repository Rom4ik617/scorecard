class ScorecardController < ApplicationController
  def index
    @repository = 'ruby/ruby'
    @scoring_guidelines = {
      'PullRequestEvent' => 12,
      'PullRequestReviewCommentEvent' => 1,
      'PullRequestReviewEvent' => 3
    }
    @weekly_contributors = fetch_weekly_top_contributors
  end

  private

  def fetch_weekly_top_contributors
    client = Octokit::Client.new
    events = client.repository_events(@repository)

    current_week_start = Time.now.beginning_of_week.strftime('%Y-%m-%d')
    weekly_contributors = Hash.new { |hash, key| hash[key] = { total_points: 0, top_contributors: [], event_points: Hash.new(0) } }

    events.each do |event|
      contributor = event.actor.login
      week_start = event.created_at.beginning_of_week.strftime('%Y-%m-%d')

      if week_start == current_week_start && @scoring_guidelines.key?(event.type)
        points = @scoring_guidelines[event.type]
        weekly_contributors[current_week_start][:total_points] += points
        weekly_contributors[current_week_start][:event_points][contributor] += points
      end
    end

    weekly_contributors.transform_values! do |data|
      top_contributors = data[:event_points].map { |contributor, points| { contributor: contributor, points: points } }
      data[:top_contributors] = top_contributors.sort_by { |c| -c[:points] }.first(3)
      data
    end

    update_database(weekly_contributors[current_week_start])

    weekly_contributors.sort_by { |week, data| data[:total_points] }.reverse.to_h
  end

  def update_database(weekly_data)
    weekly_data[:top_contributors].each do |contributor_data|
      db_record = WeeklyContributor.find_or_create_by(week_start: Time.now.beginning_of_week, contributor: contributor_data[:contributor]) do |record|
        record.points = 0
      end
      db_record.points = contributor_data[:points]
      db_record.save
    end
  end
end
