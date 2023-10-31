class AppointmentFactory
  def self.find_or_create(attributes = {})
    Appointment.find_or_initialize_by(id: attributes[:id]).tap do |appointment|
      appointment.attributes = filtered_attributes(attributes[:appointment])
    end
  end

  def self.filtered_attributes(appointment_attributes)
    return {} unless appointment_attributes.present?

    {
      time_block_type: TimeBlockType.find_by_code(appointment_attributes[:time_block_type_code]),
      notes:           appointment_attributes[:notes],
      stylist_id:      appointment_attributes[:stylist_id],
      is_cancelled:    appointment_attributes[:is_cancelled],
      tip:             appointment_attributes[:tip]
    }
  end
end