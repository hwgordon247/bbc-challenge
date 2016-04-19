
feature 'Home page' do

  scenario 'has the application title' do
    visit '/'
    expect(page).to have_content "BBC Challenge"
  end

end
