class Appointment < ActiveRecord::Base
  def self.save_from_params(params)
    a = AppointmentFactory.find_or_create(params)

    if a.time_block_type_code == "APPOINTMENT"
      a.client = self.build_client(params, a.stylist.salon)
    else
      a.client = Client.no_client
      a.length = Appointment.determine_length(
        start_time: params[:appointment][:start_time_time],
        end_time:   params[:appointment][:end_time],
      )
    end

    a.set_time(params[:appointment][:start_time_time], params[:appointment][:start_time_ymd])
    a.set_repeat_logic(params)
    a.save
    a.set_payments_from_json_string(params[:serialized_payments])
    a.set_services_and_products_from_json_string(params[:serialized_products_and_services])
    a.record_transactions

    if !a.new_record?
      a.reload.generate_recurrence_hash_if_needed
      a.reload.save_future
    end
    a
  end
end