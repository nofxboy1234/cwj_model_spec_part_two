RSpec.describe "Grocery list", type: :system do
  let!(:banana) { create(:grocery_item) }

  describe "deleting a grocery item" do
    it "removes the item" do
      within ".grocery-item-#{banana.id}" do
        click_on "Delete"
      end

      expect(page).not_to have_content(banana.name)
    end
  end
end
