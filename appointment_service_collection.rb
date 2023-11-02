class AppointmentServiceCollection
  def initialize(appointment_services)
    @appointment_services = appointment_services
  end

  def to_h
    @appointment_services.to_h { |item|
      #item.serializable_hash.merge(
        #"price" => number_with_precision(item.price, :precision => 2),
        #"label" => item.service.name,
        #"item_id" => item.service.id,
        #"type" => "service"
      #)
    }
  end
end