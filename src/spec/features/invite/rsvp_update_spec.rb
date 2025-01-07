# spec/features/books/create_spec.rb

RSpec.feature 'Answering RSVP' do
  it 'creates a new invite when given valid attributes' do
    visit '/books/new'

    fill_in 'First Name', with: 'Justine'
    fill_in 'Last Name', with: 'Quiapos'
    click_on 'Create'

    expect(page).to have_content 'Invite created'
  end

  it 'shows errors and does not create the book when given invalid attributes' do
    visit '/books/new'

    fill_in 'First Name', with: 'Practical Object-Oriented Design in Ruby'
    click_on 'Create'

    expect(page).to have_content 'Could not create book'
    expect(page).to have_field 'First Name', with: 'Practical Object-Oriented Design in Ruby'
    expect(page).to have_field 'Last Name', with: ''
  end
end
