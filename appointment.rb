class Appointment < ActiveRecord::Base
  def services_with_info
    appointment_services.collect { |item|
      item.serializable_hash.merge(
        "price" => number_with_precision(item.price, :precision => 2),
        "label" => item.service.name,
        "item_id" => item.service.id,
        "type" => "service"
      )
    }
  end

  def products_with_info
    appointment_products.collect { |item|
      item.serializable_hash.merge(
        "price" => number_with_precision(item.price, :precision => 2),
        "label" => item.product.name,
        "item_id" => item.product.id,
        "type" => "product"
      )
    }
  end
end