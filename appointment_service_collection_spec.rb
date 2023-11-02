require 'spec_helper'

describe AppointmentServiceCollection do
  describe '#to_h' do
    it 'works' do
      appointment_service = create(
        :appointment_service,
        price: 30,
        service: create(:service, name: 'Mens Haircut')
      )

      collection = AppointmentServiceCollection.new([appointment_service])

      item = collection.to_h.first
      expect(item['price']).to eq('30.00')
      expect(item['label']).to eq('Mens Haircut')
      expect(item['item_id']).to eq(appointment_service.service.id)
      expect(item['type']).to eq('service')
    end
  end
end