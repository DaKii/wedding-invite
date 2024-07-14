# frozen_string_literal: true

RSpec.describe WeddingInvite::Actions::Invite::Create do
  let(:params) { Hash[] }

  # it 'works' do
  #   response = subject.call(params)
  #   expect(response).to be_successful
  # end

  it 'sends_email' do
    puts WeddingInvite::Actions::Invite::Create.send_email
  end
end
