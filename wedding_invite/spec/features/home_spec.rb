# Capybara rspec test
RSpec.feature 'Home' do
  let(:books) { Hanami.app['persistence.rom'].relations[:books] }

  before do
    books.insert(first_name: 'Mochi', last_name: 'Pochi', email: 'mochi@mail.com', rsvp: true)
    books.insert(first_name: 'Tigger', last_name: 'Oni', email: 'tigger@mail.com', rsvp: false)
    books.insert(first_name: 'TJ', last_name: 'Winne', email: 'tj@mail.com')
  end

  scenario 'visiting the home page shows a list of invites' do
    visit '/'

    expect(page).to have_content 'Invites'
    expect(page).to have_selector 'li', text: 'Invite 1'
    expect(page).to have_selector 'li', text: 'Invite 2'
  end
end
