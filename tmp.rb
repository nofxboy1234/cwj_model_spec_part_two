describe 'attributes' do
  let!(:time_block_type) { create(:time_block_type, code: 'APPOINTMENT') }
  let!(:stylist) { create(:stylist) }

  let(:appointment) do
    AppointmentFactory.find_or_create(
      appointment: {
        time_block_type_code: 'APPOINTMENT',
        notes: 'always late',
        stylist_id: stylist.id,
        is_cancelled: 'true',
        tip: '100'
      }
    )
  end

  it 'sets the proper attributes' do
    expect(appointment.time_block_type).to eq(time_block_type)
    expect(appointment.notes).to eq('always late')
    expect(appointment.stylist).to eq(stylist)
    expect(appointment.is_cancelled).to be true
    expect(appointment.tip).to eq(100)
  end
end