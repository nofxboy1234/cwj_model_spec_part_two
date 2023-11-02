require 'date'

class CreditCard
  NUMBER_LENGTH = 16
  NUMBER_LENGTH_AMEX = 15

  def initialize(number, expiration_date, brand)
    @number = number
    @expiration_date = expiration_date
    @brand = brand
  end

  def valid?
    number_is_right_length? && !expired?
  end

  def expired?
    DateTime.now.to_date > Date.new(*expiration_year_and_month)
  end

  def expiration_year_and_month
    month, year = @expiration_date.split('/').map(&:to_i)
    [year + 2000, month]
  end

  def number_is_right_length?
    stripped_number.length == correct_card_length
  end

  def correct_card_length
    if @brand == 'American Express'
      NUMBER_LENGTH_AMEX
    else
      NUMBER_LENGTH
    end
  end

  def stripped_number
    @number.gsub(/\s+/, '')
  end
end