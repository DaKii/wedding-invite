# Capybara rspec test
RSpec.feature 'Home' do
  let(:attendees) { Hanami.app['persistence.rom'].relations[:attendees] }

  before do
    attendees.insert(name: 'Mochi', rsvp: true)
    attendees.insert(name: 'Tigger', rsvp: false)
    attendees.insert(name: 'TJ')
  end

  scenario 'visiting the home page shows a list of invites' do
    visit '/'

    expect(page).to have_content 'Invites'
    expect(page).to have_selector 'li', text: 'Invite 1'
    expect(page).to have_selector 'li', text: 'Invite 2'
  end
end
