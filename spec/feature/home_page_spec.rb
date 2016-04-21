
feature 'Home page' do

  scenario 'has the application title' do
    visit '/'
    expect(page).to have_content "BBC Challenge"
  end

  scenario 'has current program letter' do
    visit '/'
    expect(page).to have_content "Current Program letter: A"
  end

  scenario 'has current program page' do
    visit '/'
    expect(page).to have_content "Current Program page: 1"
  end

  scenario 'can list the relevant programs' do
    visit '/'
    expect(page).to have_content "Programmes:"
    expect(page).to have_content "Abadas"
  end

  scenario 'can search by a different letter' do
    visit '/'
    click_button 'B'
    expect(page).to have_content "Baby Jake"
  end

end
