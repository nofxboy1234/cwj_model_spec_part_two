require 'spec_helper'

describe AppointmentServiceCollection do
  describe '#to_h' do
    let(:appointment_service) do
      create(
        :appointment_service,
        price: 30,
        service: create(:service, name: 'Mens Haircut')
      )
    end

    let(:item) { AppointmentServiceCollection.new([appointment_service]).to_h.first }

    it 'adds the right attributes' do
      expect(item['price']).to eq('30.00')
      expect(item['label']).to eq('Mens Haircut')
      expect(item['item_id']).to eq(appointment_service.service.id)
      expect(item['type']).to eq('service')
    end
  end
end