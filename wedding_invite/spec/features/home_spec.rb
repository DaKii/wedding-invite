# Capybara rspec test
RSpec.feature 'Home' do
  scenario 'visiting the home page shows a list of invites' do
    visit '/'

    expect(page).to have_content 'Invites'
    expect(page).to have_selector 'li', text: 'Invite 1'
    expect(page).to have_selector 'li', text: 'Invite 2'
  end
end
