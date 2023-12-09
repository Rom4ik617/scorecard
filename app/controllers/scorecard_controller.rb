class ScorecardController < ApplicationController
  def index
    @repository = 'Rom4ik617/scorecard'
    @scoring_guidelines = {
      'PullRequestEvent' => 12,
      'PullRequestReviewCommentEvent' => 1,
      'PullRequestReviewEvent' => 3
    }
    @top_contributors = fetch_top_contributors
  end

  private

  def fetch_top_contributors
    client = Octokit::Client.new(access_token: ENV['GITHUB_ACCESS_TOKEN'])
    events = client.repository_events(@repository)

    contributors = Hash.new(0)

    events.each do |event|
      event_type = event.type
      contributor = event.actor.login

      if @scoring_guidelines.key?(event_type)
        contributors[contributor] += @scoring_guidelines[event_type]
      end
    end

    contributors.sort_by { |_user, points| points }.reverse.to_h
  end
end
