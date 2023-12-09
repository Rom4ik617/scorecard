class ScorecardController < ApplicationController
  def index
    @repository = 'ruby/ruby'
    @scoring_guidelines = {
      'PullRequestEvent' => 12,
      'PullRequestReviewCommentEvent' => 1,
      'PullRequestReviewEvent' => 3
    }
    @weekly_top_contributors = fetch_weekly_top_contributors
  end

  private

  def fetch_weekly_top_contributors
    client = Octokit::Client.new
    events = client.repository_events(@repository)

    current_week_start = Time.now.beginning_of_week.strftime('%Y-%m-%d')
    weekly_contributors = Hash.new { |hash, key| hash[key] = { total_points: 0, top_contributor: nil, event_points: Hash.new(0) } }

    events.each do |event|
      contributor = event.actor.login
      week_start = event.created_at.beginning_of_week.strftime('%Y-%m-%d')

      if week_start == current_week_start
        if @scoring_guidelines.key?(event.type)
          points = @scoring_guidelines[event.type]
          weekly_contributors[current_week_start][:total_points] += points
          weekly_contributors[current_week_start][:event_points][contributor] += points
        end
      end
    end

    weekly_contributors.transform_values! do |data|
      top_contributor = data[:event_points].max_by { |_user, points| points }
      data[:top_contributor] = top_contributor[0] if top_contributor
      data
    end

    weekly_contributors.sort_by { |week, data| data[:total_points] }.reverse.to_h
  end
end
