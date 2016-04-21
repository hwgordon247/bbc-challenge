
feature 'Home page' do

  scenario 'has the application title' do
    visit '/'
    expect(page).to have_content "BBC Challenge"
  end

  scenario 'has current program letter' do
    visit '/'
    expect(page).to have_content "Current Program letter: A"
  end

end
