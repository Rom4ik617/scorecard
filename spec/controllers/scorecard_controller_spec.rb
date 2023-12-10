require 'rails_helper'

RSpec.describe ScorecardController, type: :controller do
  describe 'GET #index' do
    it 'responds with success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'assigns the correct values to instance variables' do
      get :index
      expect(assigns(:repository)).to eq('ruby/ruby')
      expect(assigns(:scoring_guidelines)).to be_a(Hash)
      expect(assigns(:weekly_contributors)).to be_a(Hash)
    end
  end

  describe 'private methods' do
    before do
      allow_any_instance_of(Octokit::Client).to receive(:repository_events).and_return([])
    end

    it 'fetches weekly top contributors' do
      expect(controller.send(:fetch_weekly_top_contributors)).to be_a(Hash)
    end
  end
end
