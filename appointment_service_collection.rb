class AppointmentServiceCollection
  include ActionView::Helpers::NumberHelper
  ITEM_TYPE = 'service'

  def initialize(appointment_services)
    @appointment_services = appointment_services
  end

  def to_h
    @appointment_services.map do |appointment_service|
      appointment_service.serializable_hash.merge(extra_attributes(appointment_service))
    end
  end

  private

  def extra_attributes(appointment_service)
    {
      'price'   => number_with_precision(appointment_service.price, precision: 2),
      'label'   => appointment_service.service.name,
      'item_id' => appointment_service.service.id,
      'type'    => ITEM_TYPE
    }
  end
end