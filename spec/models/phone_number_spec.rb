require 'rails_helper'

RSpec.describe PhoneNumber, type: :model do
  context 'phone number contains dashes' do
    it 'strips out the dashes' do
      phone_number = FactoryBot.create(
        :phone_number,
        value: '555-856-8075'
      )

      expect(phone_number.value).to eq('5558568075')
    end
  end
end
