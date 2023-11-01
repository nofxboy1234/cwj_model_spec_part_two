require_relative 'payment'
require_relative 'payment_gateway'
require_relative 'logger'

describe Payment do
  it 'records the payment' do
    # Stub
    payment_gateway = double()
    allow(payment_gateway).to receive(:charge).and_return(payment_id: 1234)
    
    logger = Logger.new

    payment = Payment.new(payment_gateway, logger)
    payment.total_cents = 1800
    payment.save
  end
end