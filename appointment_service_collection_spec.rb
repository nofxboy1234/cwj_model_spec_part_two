require 'spec_helper'

describe AppointmentServiceCollection do
  describe '#to_h' do
    it 'works' do
      appointment_service = create(:appointment_service)
      collection = AppointmentServiceCollection.new([appointment_service])
    end
  end
end