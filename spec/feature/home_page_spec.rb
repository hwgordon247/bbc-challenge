
feature 'Home page' do

  scenario 'has the application title' do
    visit '/'
    expect(page).to have_content "BBC Challenge"
  end

  scenario 'has current programme letter' do
    visit '/'
    expect(page).to have_content "Current Programme letter: A"
  end

  scenario 'has current programme page' do
    visit '/'
    expect(page).to have_content "Current Programme page: 1"
  end

  scenario 'can list the relevant programmes' do
    visit '/'
    expect(page).to have_content "Programmes:"
    expect(page).to have_content "Abadas"
  end

  scenario 'can search by a different letter' do
    visit '/'
    click_button 'B'
    expect(page).to have_content "Baby Jake"
  end

  scenario 'can visit another page of programmes' do
    visit '/'
    click_button 'A'
    click_button '2'
    expect(page).to have_content "Alistair Cooke's America"
  end

  scenario 'can display total number of pages' do
    visit '/'
    click_button 'A'
    expect(page).to have_content "Total Pages: 4"
  end

end
