module PageObjects
  class GroceryList
    include Capybara::DSL

    def click_delete(item)
      within ".grocery-item-#{item.id}" do
        click_on "Delete"
      end
    end

    def has_item?(item)
      page.has_content?(item.name)
    end
  end
end
