class ScorecardController < ApplicationController
  def scorecard
    @contributors = Contributor.order(total_score: :desc).limit(5)
    render json: @contributors, each_serializer: ContributorSerializer
  end
end
