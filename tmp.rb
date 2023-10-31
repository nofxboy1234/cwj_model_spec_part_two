describe 'attributes' do
  let!(:time_block_type) { create(:time_block_type, code: 'APPOINTMENT') }

  let(:appointment) do
    AppointmentFactory.find_or_create(
      appointment: { time_block_type_code: 'APPOINTMENT' }
    )
  end

  it 'sets a time block type' do
    expect(appointment.time_block_type).to eq(time_block_type)
  end
end