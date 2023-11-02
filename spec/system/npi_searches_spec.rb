require 'rails_helper'

RSpec.describe "NPISearches", type: :system do
  it 'shows the physician NPI number' do
    visit new_npi_search_path
    # sleep(1)
    fill_in 'first_name', with: 'joel'
    # sleep(1)
    fill_in 'last_name', with: 'fuhrman'
    # sleep(1)
    click_on 'Search'
    sleep(2)

    # 1386765287 is the NPI code for Dr. Joel Fuhrman
    expect(page).to have_content('1386765287')
  end
end
