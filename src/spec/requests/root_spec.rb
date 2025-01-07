# frozen_string_literal: true

RSpec.describe 'Root', type: :request do
  it 'found' do
    get '/'

    # Generate new action via:
    #   `bundle exec hanami generate action home.index --url=/`

    expect(last_response.body).to include 'Wedding Invite'
    expect(last_response).to be_successful
  end
end
