require 'rails_helper'

RSpec.describe "NPISearches", type: :system do
  it 'shows the physician NPI number' do
    visit new_npi_search_path
    fill_in 'first_name', with: 'joel'
    fill_in 'last_name', with: 'fuhrman'
    click_on 'Search'

    # 1386765287 is the NPI code for Dr. Joel Fuhrman
    expect(page).to have_content('1386765287')
  end
end
