describe Payment do
  it 'records the payment' do
    payment_gateway = PaymentGateway.new
    logger = Logger.new

    payment = Payment.new(payment_gateway, logger)
    payment.total_cents = 1800
    payment.save
  end
end