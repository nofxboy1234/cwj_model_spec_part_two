class AppointmentFactory
  def self.find_or_create(attributes = {})
    appointment = attributes[:id] ? Appointment.find(attributes[:id]) : Appointment.new
    return appointment unless attributes[:appointment].present?

    appointment.attributes = {
      time_block_type: TimeBlockType.find_by_code(attributes[:appointment][:time_block_type_code]),
      notes:           attributes[:appointment][:notes],
      stylist_id:      attributes[:appointment][:stylist_id],
      is_cancelled:    attributes[:appointment][:is_cancelled],
      tip:             attributes[:appointment][:tip]
    }

    appointment
  end
end