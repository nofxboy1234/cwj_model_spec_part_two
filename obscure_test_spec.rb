RSpec.describe "Grocery list", type: :system do
  let!(:banana) { create(:grocery_item) }
  let!(:grocery_list) { PageObjects::GroceryList.new }

  describe "deleting a grocery item" do
    it "removes the item" do
      grocery_list.click_delete(banana)
      expect(grocery_list).not_to have_item(banana)
    end
  end
end