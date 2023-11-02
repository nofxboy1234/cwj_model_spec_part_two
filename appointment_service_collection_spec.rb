require 'spec_helper'

describe AppointmentServiceCollection do
  describe '#to_h' do
    it 'works' do
      appointment_service = create(:appointment_service)
      collection = AppointmentServiceCollection.new([appointment_service])
      expect(collection.to_h).to eq('asdf')
    end
  end
end