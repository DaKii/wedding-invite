# frozen_string_literal: true

RSpec.describe WeddingInvite::Actions::Home::Index do
  let(:params) { Hash[] }

  it 'works' do
    visit '/'

    response = subject.call(params)
    expect(response).to be_successful
  end
end
